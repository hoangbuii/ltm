#include <iostream>
#include <fstream>
#include <cstring>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUF_SIZE 4096

using namespace std;

int main(int argc, char *argv[]) {
    if (argc != 2) {
        cerr << "Usage: " << argv[0] << " <port>" << endl;
        exit(EXIT_FAILURE);
    }

    int port = atoi(argv[1]);

    int server_socket, n;
    socklen_t client_len;
    char buffer[BUF_SIZE];
    struct sockaddr_in server_addr, client_addr;

    // Create UDP socket
    server_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if (server_socket < 0) {
        perror("Error opening socket");
        exit(EXIT_FAILURE);
    }

    // Initialize server address
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(port);

    // Bind socket to port
    if (bind(server_socket, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
        perror("Error binding socket");
        exit(EXIT_FAILURE);
    }

    cout << "Server running on port " << port << endl;

    while (true) {
        // Receive command and filename from client
        client_len = sizeof(client_addr);
        n = recvfrom(server_socket, buffer, BUF_SIZE, 0, (struct sockaddr *) &client_addr, &client_len);
        if (n < 0) {
            perror("Error receiving from client");
            continue;
        }

        string command(buffer, 8);
        string filename(buffer+8, n-8);

        cout << "Received command: " << command << " filename: " << filename << endl;

        // Open file
        ifstream file(filename, ios::binary);
        if (!file) {
            // Send error message to client if file not found
            cout << "File not found: " << filename << endl;
            sendto(server_socket, "ERROR", 5, 0, (struct sockaddr *) &client_addr, client_len);
            continue;
        }

        // Get file size
        file.seekg(0, ios::end);
        int file_size = file.tellg();
        file.seekg(0, ios::beg);

        // Send file size to client
        cout << "File found: " << filename << ", size: " << file_size << endl;
        sendto(server_socket, to_string(file_size).c_str(), to_string(file_size).size(), 0, (struct sockaddr *) &client_addr, client_len);

        // Send file to client
        int bytes_sent = 0;
        while (bytes_sent < file_size) {
            file.read(buffer, BUF_SIZE);
            int n_sent = sendto(server_socket, buffer, file.gcount(), 0, (struct sockaddr *) &client_addr, client_len);
            if (n_sent < 0) {
                perror("Error sending to client");
                break;
            }
            bytes_sent += n_sent;
        }

        file.close();
    }

    close(server_socket);

    return 0;
}

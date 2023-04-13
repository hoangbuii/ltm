#include <iostream>
#include <fstream>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>

using namespace std;

#define PORT 8080
#define BUFFER_SIZE 1024

int main() {
    int clientSocket, len;
    struct sockaddr_in serverAddress;
    char buffer[BUFFER_SIZE] = {0};

    // Create UDP socket
    if ((clientSocket = socket(AF_INET, SOCK_DGRAM, 0)) == 0) {
       
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    // Get server IP address from user input
    string serverIP;
    cout << "Enter server IP address: ";
    cin >> serverIP;

    // Set server address parameters
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_port = htons(PORT);
    if (inet_pton(AF_INET, serverIP.c_str(), &serverAddress.sin_addr) <= 0) {
        perror("inet_pton failed");
        exit(EXIT_FAILURE);
    }

    // Connect to server
    if (connect(clientSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
        perror("connect failed");
        exit(EXIT_FAILURE);
    }

    // Send request to server
        send(clientSocket, "REQUEST", strlen("REQUEST"), 0);

        // Receive acknowledgement from server
        memset(buffer, 0, sizeof(buffer));
        if (recv(clientSocket, buffer, BUFFER_SIZE, 0) < 0) {
            perror("recv failed");
            exit(EXIT_FAILURE);
        }

    while (true) {

        // Send filename to server
        string filename;
        cout << "Enter filename to download: ";
        cin >> filename;
        send(clientSocket, filename.c_str(), filename.length(), 0);

        memset(buffer, 0, sizeof(buffer));
        if (recv(clientSocket, buffer, BUFFER_SIZE, 0) < 0) {
            perror("recv failed");
            exit(EXIT_FAILURE);
        } else {
            cout << buffer << endl;
            if (buffer == "ERROR") {
                continue;
            }
        }


        // Receive file size from server
        int fileSize;
        memset(buffer, 0, sizeof(buffer));
        if (recv(clientSocket, (char *)&fileSize, sizeof(int), 0) < 0) {
            perror("recv failed");
            exit(EXIT_FAILURE);
        }

        if (fileSize > 1024) {
            cout << "File not found" << endl;
            continue;
        }

        // Display file size and download file
        cout << "File size: " << fileSize << " bytes" << endl;
        ofstream file(filename, ios::binary);
        if (!file.is_open()) {
            cout << "Could not create file " << filename << endl;
            exit(EXIT_FAILURE);
        }
        int bytesReceived = 0;
        while (bytesReceived < fileSize) {
            int bytesRead = recv(clientSocket, buffer, BUFFER_SIZE, 0);
            if (bytesRead < 0) {
                perror("recv failed");
                exit(EXIT_FAILURE);
            }
            file.write(buffer, bytesRead);
            bytesReceived += bytesRead;
        }
        file.close();
        cout << "File transfer complete" << endl;
    }

    // Close socket and exit client
    close(clientSocket);
    return 0;
}
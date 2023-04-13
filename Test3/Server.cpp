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
    int serverSocket, clientSocket, len;
    struct sockaddr_in serverAddress, clientAddress;
    char buffer[BUFFER_SIZE] = {0};

    // Create UDP socket
    if ((serverSocket = socket(AF_INET, SOCK_DGRAM, 0)) == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    // Set server address parameters
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = INADDR_ANY;
    serverAddress.sin_port = htons(PORT);

    // Bind socket to the specified address and port
    if (bind(serverSocket, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    // Wait for client to connect
    cout << "Waiting for client to connect..." << endl;

    len = sizeof(clientAddress);
    memset(buffer, 0, sizeof(buffer));


    // Receive request from client
        if (recvfrom(serverSocket, buffer, BUFFER_SIZE, 0, (struct sockaddr *)&clientAddress, (socklen_t *)&len) < 0) {
            
            perror("recvfrom failed");
            exit(EXIT_FAILURE);
        }
        // Send acknowledgement to client
        sendto(serverSocket, "ACK", strlen("ACK"), 0, (struct sockaddr *)&clientAddress, len);
        
        

    while (true) {

        // Receive filename from client
        memset(buffer, 0, sizeof(buffer));
        if (recvfrom(serverSocket, buffer, BUFFER_SIZE, 0, (struct sockaddr *)&clientAddress, (socklen_t *)&len) < 0) {
            perror("recvfrom failed");
            exit(EXIT_FAILURE);
        }
        string filename(buffer);

        // Open file and get size
        int success = 0;
        ifstream file(filename, ios::binary);
        if (!file.is_open()) {
            cout << "File " << filename << " not found" << endl;
            sendto(serverSocket, &success, sizeof(success), 0);
            //sendto(serverSocket, "ERROR", strlen("ERROR"), 0, (struct sockaddr *)&clientAddress, len);
            //exit(EXIT_FAILURE);
            continue;
        } else {
            success = 1;
            sendto(serverSocket, &success, sizeof(success), 0);
            //sendto(serverSocket, "OK", strlen("OK"), 0, (struct sockaddr *)&clientAddress, len);
        }
        file.seekg(0, ios::end);
        int fileSize = file.tellg();
        file.seekg(0, ios::beg);

        // Send file size to client
        sendto(serverSocket, (char *)&fileSize, sizeof(int), 0, (struct sockaddr *)&clientAddress, len);

        // Send file to client
        char fileBuffer[BUFFER_SIZE];
        int bytesRead;
        while ((bytesRead = file.readsome(fileBuffer, BUFFER_SIZE)) > 0) {
            sendto(serverSocket, fileBuffer, bytesRead, 0, (struct sockaddr *)&clientAddress, len);
        }
        file.close();
        cout << "File transfer complete" << endl;
    }
    
    // Exit server
    close(serverSocket);
    
    return 0;
}

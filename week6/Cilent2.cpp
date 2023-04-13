#include <iostream>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <cstring>
#include <fstream>

using namespace std;

int main() {
    // create UDP socket
    int clientSocket = socket(AF_INET, SOCK_DGRAM, 0);
    if (clientSocket < 0) {
        cout << "Failed to create socket" << endl;
        return 0;
    }

    // set up server address
    struct sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_port = htons(8080);
    serverAddress.sin_addr.s_addr = inet_addr("192.168.92.101");

    // connect to server
    if (connect(clientSocket, (struct sockaddr*) &serverAddress, sizeof(serverAddress)) < 0) {
        cout << "Failed to connect to server" << endl;
        return 0;
    }

    // start session
    cout << "Session started" << endl;

    // download files
    char filename[256];
    while (true) {
        // prompt user for filename
        cout << "Enter filename (or 'quit' to end session): ";
        cin >> filename;

        // check if user wants to end session
        if (strcmp(filename, "quit") == 0) {
            break;
        }

        // send filename to server
        send(clientSocket, filename, strlen(filename), 0);

        // receive file info from server
        char fileInfo[256];
        memset(fileInfo, 0, sizeof(fileInfo));
        recv(clientSocket, fileInfo, sizeof(fileInfo), 0);

        // check if file exists
        if (strcmp(fileInfo, "ERROR") == 0) {
            cout << "File not found on server" << endl;
            continue;
        }

        // parse file info
        char* fileSizeStr = strtok(fileInfo, ",");
        int fileSize = atoi(fileSizeStr);
        char* fileName = strtok(NULL, ",");

        // receive file data from server
        char buffer[1024];
        ofstream outputFile(fileName, ios::out | ios::binary);
        int bytesReceived = 0;
        while (bytesReceived < fileSize) {
            int bytes = recv(clientSocket, buffer, sizeof(buffer), 0);
            if (bytes < 0) {
                cout << "Failed to receive file data" << endl;
                break;
            }
            outputFile.write(buffer, bytes);
            bytesReceived += bytes;
        }
        outputFile.close();

        // print download success message
        cout << "Downloaded file '" << fileName << "' (" << fileSize << " bytes)" << endl;
    }

    // end session
    cout << "Session ended" << endl;
    close(clientSocket);

    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#define MAX_BUF_SIZE 1024
#define PORT 8080

void error(const char *msg)
{
    perror(msg);
    exit(0);
}

int main(int argc, char *argv[])
{
    int sockfd, n;
    struct sockaddr_in serv_addr;
    struct hostent *server;

    char buffer[MAX_BUF_SIZE];

    // Create a socket
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
        error("ERROR opening socket");

    // Get the server IP address
    printf("Enter server IP address: ");
    bzero(buffer, MAX_BUF_SIZE);
    fgets(buffer, MAX_BUF_SIZE, stdin);
    buffer[strcspn(buffer, "\n")] = 0;
    server = gethostbyname(buffer);
    if (server == NULL)
        error("ERROR, no such host");

    // Set up the server address struct
    bzero((char *)&serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
    serv_addr.sin_port = htons(PORT);

    // Connect to the server
    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        error("ERROR connecting");

    // Get the filename to download
    printf("Enter filename to download: ");
    bzero(buffer, MAX_BUF_SIZE);
    fgets(buffer, MAX_BUF_SIZE, stdin);
    buffer[strcspn(buffer, "\n")] = 0;

    // Send the command and filename to the server
    n = write(sockfd, "DOWNLOAD", 9);
    if (n < 0)
        error("ERROR writing to socket");

    n = write(sockfd, buffer, strlen(buffer));
    if (n < 0)
        error("ERROR writing to socket");

    // Read the response from the server
    bzero(buffer, MAX_BUF_SIZE);
    n = read(sockfd, buffer, MAX_BUF_SIZE);
    if (n < 0)
        error("ERROR reading from socket");

    // If the file does not exist on the server, print an error and exit
    if (strcmp(buffer, "ERROR: FILE NOT FOUND") == 0)
    {
        printf("Error: file not found on server.\n");
        close(sockfd);
        exit(1);
    }

    // If the file exists, print the file size and begin downloading the file
    printf("File size: %s bytes\n", buffer);

    FILE *file = fopen(buffer, "wb");
    if (file == NULL)
        error("ERROR creating file");

    // Read the file data from the server and write it to the local file
    while (1)
    {
        bzero(buffer, MAX_BUF_SIZE);
        n = read(sockfd, buffer, MAX_BUF_SIZE);
        if (n <= 0)
            break;

        fwrite(buffer, sizeof(char), n, file);
    }

    // Close the file and socket
    fclose(file);
    close(sockfd);

    printf("File %s downloaded successfully.\n", buffer);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <fcntl.h>

#define PORT 8080
#define MAX_BUFFER_SIZE 1024

int main(int argc, char const *argv[])
{
    int server_fd, new_socket, valread;
    struct sockaddr_in address;
    int addrlen = sizeof(address);
    char buffer[MAX_BUFFER_SIZE] = {0};
    char *file_name = "sample.txt";

    // Create a socket
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0)
    {
        perror("Socket creation failed");
        exit(EXIT_FAILURE);
    }

    // Set socket options to reuse address and port
    int opt = 1;
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt)))
    {
        perror("Setsockopt failed");
        exit(EXIT_FAILURE);
    }

    // Bind the socket to a specific port and IP address
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0)
    {
        perror("Bind failed");
        exit(EXIT_FAILURE);
    }

    // Listen for incoming connections
    if (listen(server_fd, 3) < 0)
    {
        perror("Listen failed");
        exit(EXIT_FAILURE);
    }

    // Accept incoming connections from clients
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t *)&addrlen)) < 0)
    {
        perror("Accept failed");
        exit(EXIT_FAILURE);
    }

    // Open the file that needs to be transferred
    int fd = open(file_name, O_RDONLY);
    if (fd == -1)
    {
        perror("File open failed");
        exit(EXIT_FAILURE);
    }

    // Read the file contents and send it to the client
    int bytes_read;
    while ((bytes_read = read(fd, buffer, MAX_BUFFER_SIZE)) > 0)
    {
        if (send(new_socket, buffer, bytes_read, 0) == -1)
        {
            perror("Send failed");
            exit(EXIT_FAILURE);
        }
        memset(buffer, 0, MAX_BUFFER_SIZE);
    }

    // Close the file and the connection
    close(fd);
    close(new_socket);
    close(server_fd);

    return 0;
}

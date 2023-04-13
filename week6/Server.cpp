#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <fcntl.h>

#define BUF_SIZE 1024
#define PORT 8080

int main() {
    struct sockaddr_in server_addr, client_addr;
    char buffer[BUF_SIZE];
    int server_socket, client_socket, addr_len, n;
    ssize_t file_size;
    socklen_t client_len;
    char filename[BUF_SIZE];
    int fd;
    struct stat file_info;

    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);

    if ((server_socket = socket(AF_INET, SOCK_DGRAM, 0)) == 0) {
        perror("socket creation failed");
        exit(EXIT_FAILURE);
    }

    if (bind(server_socket, (const struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    printf("Server listening on port %d...\n", PORT);

    while (1) {
        memset(buffer, 0, BUF_SIZE);
        addr_len = sizeof(client_addr);

        n = recvfrom(server_socket, (char *)buffer, BUF_SIZE, MSG_WAITALL, (struct sockaddr *)&client_addr, &addr_len);

        if (n < 0) {
            perror("recvfrom failed");
            exit(EXIT_FAILURE);
        }

        buffer[n] = '\0';

        if (strcmp(buffer, "DOWNLOAD") == 0) {
            printf("Client requested a file...\n");

            n = recvfrom(server_socket, filename, BUF_SIZE, MSG_WAITALL, (struct sockaddr *)&client_addr, &addr_len);

            if (n < 0) {
                perror("recvfrom failed");
                exit(EXIT_FAILURE);
            }

            filename[n] = '\0';

            printf("Client requested file: %s\n", filename);

            if (stat(filename, &file_info) == -1) {
                printf("File not found\n");
                sendto(server_socket, "ERROR", strlen("ERROR"), 0, (const struct sockaddr *)&client_addr, addr_len);
            } else {
                printf("File found, size: %ld bytes\n", file_info.st_size);
                sendto(server_socket, (char *)&file_info.st_size, sizeof(ssize_t), 0, (const struct sockaddr *)&client_addr, addr_len);
                fd = open(filename, O_RDONLY);

                if (fd < 0) {
                    perror("open failed");
                    exit(EXIT_FAILURE);
                }

                while ((n = read(fd, buffer, BUF_SIZE)) > 0) {
                    sendto(server_socket, buffer, n, 0, (const struct sockaddr *)&client_addr, addr_len);
                }

                close(fd);

                printf("File sent successfully\n");
            }
        }
    }

    close(server_socket);

    return 0;
}
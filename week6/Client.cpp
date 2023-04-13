#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <openssl/md5.h>

#define BUF_SIZE 1024
#define PORT 8080

void md5sum(char *filename, char *md5) {
    unsigned char c[MD5_DIGEST_LENGTH];
    int i;
    FILE *fp;
    MD5_CTX mdContext;
    fp = fopen(filename, "rb");

    if (fp == NULL) {
        perror("fopen failed");
        exit(EXIT_FAILURE);
    }

    MD5_Init(&mdContext);

    int bytes;
    unsigned char data[BUF_SIZE];
    while ((bytes = fread(data, 1, BUF_SIZE, fp)) != 0) {
        MD5_Update(&mdContext, data, bytes);
    }

    MD5_Final(c, &mdContext);

    for(i = 0; i < MD5_DIGEST_LENGTH; i++) {
        sprintf(&md5[i*2], "%02x", (unsigned int)c[i]);
    }

    fclose(fp);
}

int main() {
    struct sockaddr_in server_addr;
    char buffer[BUF_SIZE];
    int client_socket, n;
    ssize_t file_size;
    socklen_t server_len;
    char filename[BUF_SIZE];
    int fd;
    struct timeval tv;
    fd_set readfds;
    int retval;
    char md5[MD5_DIGEST_LENGTH * 2 + 1];
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);

    printf("Enter server IP address: ");
    if (fgets(buffer, BUF_SIZE, stdin) != NULL) {
        buffer[strcspn(buffer, "\n")] = '\0';
        if (inet_pton(AF_INET, buffer, &server_addr.sin_addr) <= 0) {
            perror("inet_pton failed");
            exit(EXIT_FAILURE);
        }
    }

    if ((client_socket = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        perror("socket creation failed");
        exit(EXIT_FAILURE);
    }

    printf("Enter file name: ");
    if (fgets(filename, BUF_SIZE, stdin) != NULL) {
        filename[strcspn(filename, "\n")] = '\0';
    }

    sendto(client_socket, "DOWNLOAD", strlen("DOWNLOAD"), 0, (const struct sockaddr *)&server_addr, sizeof(server_addr));
    sendto(client_socket, filename, strlen(filename), 0, (const struct sockaddr *)&server_addr, sizeof(server_addr));

    server_len = sizeof(server_addr);
    n = recvfrom(client_socket, (char *)&file_size, sizeof(ssize_t), MSG_WAITALL, (struct sockaddr *)&server_addr, &server_len);

    if (n < 0) {
        perror("recvfrom failed");
        exit(EXIT_FAILURE);
    }

    if (strcmp((char *)&file_size, "ERROR") == 0) {
        printf("File not found\n");
        exit(EXIT_FAILURE);
    }

    printf("File size: %ld bytes\n", file_size);

    fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);

    if (fd < 0) {
        perror("open failed");
        exit(EXIT_FAILURE);
    }

    size_t received_bytes = 0;
    while (received_bytes < file_size) {
        tv.tv_sec = 1;
        tv.tv_usec = 0;
        FD_ZERO(&readfds);
        FD_SET(client_socket, &readfds);

        retval = select(client_socket + 1, &readfds, NULL, NULL, &tv);

        if (retval == -1) {
            perror("select failed");
            exit(EXIT_FAILURE);
        } else if (retval == 0) {
            printf("Timeout waiting for data\n");
            break;
        } else {
            n = recvfrom(client_socket, buffer, BUF_SIZE, MSG_WAITALL, (struct sockaddr *)&server_addr, &server_len);

            if (n < 0) {
                perror("recvfrom failed");
                exit(EXIT_FAILURE);
            }

            write(fd, buffer, n);
            received_bytes += n;
        }
    }

    close(fd);

    md5sum(filename, md5);
    printf("MD5 checksum: %s\n", md5);

    close(client_socket);

    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <fcntl.h>

#define PORT 12345
#define MAX_BUF_SIZE 1024

void error(const char *msg)
{
    perror(msg);
    exit(1);
}

int main()
{
    int sockfd, n;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    char buffer[MAX_BUF_SIZE];
    char filename[MAX_BUF_SIZE];
    off_t filesize;
    int fd;

    while (1)
    {
        sockfd = socket(AF_INET, SOCK_STREAM, 0);
        if (sockfd < 0)
            error("ERROR opening socket");

        printf("Enter server IP address: ");
        bzero(buffer, MAX_BUF_SIZE);
        fgets(buffer, MAX_BUF_SIZE - 1, stdin);

        server = gethostbyname(buffer);
        if (server == NULL)
        {
            printf("ERROR, no such host\n");
            continue;
        }

        bzero((char *)&serv_addr, sizeof(serv_addr));
        serv_addr.sin_family = AF_INET;
        bcopy((char *)server->h_addr,
              (char *)&serv_addr.sin_addr.s_addr,
              server->h_length);
        serv_addr.sin_port = htons(PORT);

        if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
            error("ERROR connecting");

        printf("Enter command (download <filename>, exit to quit): ");
        bzero(buffer, MAX_BUF_SIZE);
        fgets(buffer, MAX_BUF_SIZE - 1, stdin);

        if (strcmp(buffer, "exit\n") == 0)
        {
            close(sockfd);
            break;
        }

        if (strncmp(buffer, "download", 8) != 0)
        {
            printf("Invalid command\n");
            close(sockfd);
            continue;
        }

        bzero(filename, MAX_BUF_SIZE);
        sscanf(buffer, "download %s", filename);

        n = write(sockfd, buffer, strlen(buffer));
        if (n < 0)
            error("ERROR writing to socket");

        bzero(buffer, MAX_BUF_SIZE);
        n = read(sockfd, buffer, MAX_BUF_SIZE);
        if (n < 0)
            error("ERROR reading from socket");

        if (strncmp(buffer, "File not found", 14) == 0)
        {
            printf("File not found on server\n");
            close(sockfd);
            continue;
        }

        filesize = atol(buffer);

        fd = open(filename, O_CREAT | O_WRONLY, 0666);
        if (fd < 0)
            error("ERROR opening file");

        while (filesize > 0)
        {
            n = read(sockfd, buffer, MAX_BUF_SIZE);
            if (n < 0)
                error("ERROR reading from socket");

            if (write(fd, buffer, n) < 0)
                error("ERROR writing to file");

            filesize -= n;
        }

        close(fd);
        close(sockfd);

        printf("File %s downloaded successfully. Size: %ld bytes\n", filename, filesize);
    }

    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
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
    int sockfd, newsockfd, clilen, n;
    struct sockaddr_in serv_addr, cli_addr;
    char buffer[MAX_BUF_SIZE];
    char filename[MAX_BUF_SIZE];
    off_t filesize;
    int fd;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
        error("ERROR opening socket");

    bzero((char *)&serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(PORT);

    if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        error("ERROR on binding");

    listen(sockfd, 5);

    while (1)
    {
        clilen = sizeof(cli_addr);
        newsockfd = accept(sockfd, (struct sockaddr *)&cli_addr, &clilen);
        if (newsockfd < 0)
            error("ERROR on accept");

        bzero(buffer, MAX_BUF_SIZE);
        n = read(newsockfd, buffer, MAX_BUF_SIZE);
        if (n < 0)
            error("ERROR reading from socket");

        if (strcmp(buffer, "download") != 0)
        {
            n = write(newsockfd, "Invalid command", 15);
            if (n < 0)
                error("ERROR writing to socket");
            close(newsockfd);
            continue;
        }

        bzero(buffer, MAX_BUF_SIZE);
        n = read(newsockfd, buffer, MAX_BUF_SIZE);
        if (n < 0)
            error("ERROR reading from socket");

        strcpy(filename, buffer);

        fd = open(filename, O_RDONLY);
        if (fd < 0)
        {
            n = write(newsockfd, "File not found", 14);
            if (n < 0)
                error("ERROR writing to socket");
            close(newsockfd);
            continue;
        }

        filesize = lseek(fd, 0, SEEK_END);
        lseek(fd, 0, SEEK_SET);

        sprintf(buffer, "%ld", filesize);
        n = write(newsockfd, buffer, strlen(buffer));
        if (n < 0)
            error("ERROR writing to socket");

        while ((n = read(fd, buffer, MAX_BUF_SIZE)) > 0)
        {
            if (write(newsockfd, buffer, n) < 0)
                error("ERROR writing to socket");
        }

        close(fd);
        close(newsockfd);

        printf("File %s sent successfully. Size: %ld bytes\n", filename, filesize);
    }

    close(sockfd);
    return 0;
}

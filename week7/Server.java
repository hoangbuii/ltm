import java.net.*;
import java.io.*;

public class Server {
    public static void main(String[] args) throws IOException {
        int port = 8080;
        ServerSocket serverSocket = new ServerSocket(port);
        System.out.println("Server listening on port " + port);

        while (true) {
            Socket clientSocket = serverSocket.accept();
            System.out.println("Connected to client " + clientSocket.getInetAddress());

            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);

            String command = in.readLine();
            if (command.equals("download")) {
                String filename = in.readLine();
                File file = new File(filename);
                if (file.exists()) {
                    out.println("exist");
                    out.println(file.length());

                    byte[] buffer = new byte[1024];
                    FileInputStream fileInputStream = new FileInputStream(file);
                    BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
                    OutputStream outputStream = clientSocket.getOutputStream();

                    int bytesRead;
                    while ((bytesRead = bufferedInputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    outputStream.flush();
                } else {
                    out.println("not exist");
                }
            }

            in.close();
            out.close();
            clientSocket.close();
        }
    }
}

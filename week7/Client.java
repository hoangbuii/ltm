import java.net.*;
import java.io.*;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the server IP address: ");
        String serverIP = scanner.nextLine();
        int port = 12345;

        Socket socket = new Socket(serverIP, port);
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

        out.println("download");

        System.out.print("Enter the filename: ");
        String filename = scanner.nextLine();
        out.println(filename);

        String response = in.readLine();
        if (response.equals("exist")) {
            long fileSize = Long.parseLong(in.readLine());
            byte[] buffer = new byte[1024];
            InputStream inputStream = socket.getInputStream();
            FileOutputStream fileOutputStream = new FileOutputStream(filename);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);

            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                bufferedOutputStream.write(buffer, 0, bytesRead);
                fileSize -= bytesRead;
                if (fileSize == 0) {
                    break;
                }
            }
            bufferedOutputStream.flush();
            System.out.println("File downloaded successfully!");
        } else {
            System.out.println("File does not exist on the server!");
        }

        in.close();
        out.close();
        socket.close();
        scanner.close();
    }
}

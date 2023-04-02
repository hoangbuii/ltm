import java.net.*;
import java.io.*;

public class Server {
   public static void main(String[] args) throws IOException {
      ServerSocket serverSocket = new ServerSocket(5000);
      System.out.println("Server started on port 5000");

      while (true) {
         Socket socket = serverSocket.accept();
         System.out.println("Client connected: " + socket.getInetAddress().getHostName());

         BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
         PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

         String line = in.readLine();
         if (line.equals("HELO Server")) {
            out.println("200 Hello Client");
         } else {
            out.println("500 Invalid command");
            continue;
         }

         line = in.readLine();
         if (line.equals("USER INFO")) {
            out.println("210 OK");
         } else {
            out.println("500 Invalid command");
            continue;
         }

         line = in.readLine();
         try {
            String[] parts = line.split(":");
            String username = parts[1].trim();
            String age = parts[2].trim();
            out.println("211 User Info OK");
         } catch (Exception e) {
            out.println("400 User Info Error");
            continue;
         }

         line = in.readLine();
         if (line.equals("QUIT")) {
            out.println("500 bye");
            socket.close();
            break;
         } else {
            out.println("500 Invalid command");
         }
      }
   }
}

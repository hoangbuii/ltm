import java.net.*;
import java.io.*;

public class Client {
   public static void main(String[] args) throws IOException {
      Socket socket = new Socket("localhost", 5000);
      BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
      PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

      out.println("HELO Server");
      String response = in.readLine();
      System.out.println(response);

      out.println("USER INFO");
      response = in.readLine();
      System.out.println(response);

      String userInfo = "{ \"User name\": abc123, \"User age\": abc123}";
      out.println(userInfo);
      response = in.readLine();
      System.out.println(response);

      out.println("QUIT");
      response = in.readLine();
      System.out.println(response);

      socket.close();
   }
}

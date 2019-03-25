import java.io.BufferedWriter;
import java.io.FileWriter;
// ReadBytes.java
class EmailWriter {
    public static void main(String[] args) throws Exception {
        int ch;
        String filename = args[0];
        BufferedWriter writer = new BufferedWriter(new FileWriter(filename));
        while ((ch = System.in.read()) != -1) {
            writer.append((char) ch);
        }
        writer.close();
    }
}
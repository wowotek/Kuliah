import java.sql.*;
import java.util.*;

/**
 *
 * @author RayzeR-PC
 */
public class coba_select_where {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        System.out.print("Masukkan NIM : ");
        String input_nim = input.nextLine();
        
        try {
            koneksi.koneksi();
            Statement st = koneksi.con.createStatement();
            
            String query = "SELECT NIM, Nama, Umur FROM data_mahasiswa WHERE NIM = '"+input_nim+"'";    
            ResultSet rs = st.executeQuery(query);
            
            boolean ada = false;
            while (rs.next()) {
                String NIM = rs.getString("NIM");
                String nama = rs.getString("Nama");
                int umur = rs.getInt("Umur");
                System.out.println(NIM+" - "+nama+" - "+umur);
                ada = true;
            }
            
            if (ada == false) {
                System.out.println("NIM : "+input_nim+" tidak ada di database.");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}

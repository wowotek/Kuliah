import java.sql.*;
import java.util.*;

/**
 *
 * @author RayzeR-PC
 */
public class coba_delete {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        try {
            System.out.print("Masukkan NIM : ");
            String NIM = input.nextLine();

            koneksi.koneksi();
            Statement st = koneksi.con.createStatement();

            String query = "DELETE FROM data_mahasiswa WHERE NIM = '"+NIM+"'";
            if (st.executeUpdate(query) == 1) {
                System.out.println("Sukses Hapus dengan NIM "+NIM);
            } else {
                System.out.println("Gagal Hapus dengan NIM "+NIM);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}

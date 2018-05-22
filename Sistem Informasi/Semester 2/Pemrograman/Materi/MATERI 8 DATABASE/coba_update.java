import java.sql.*;
import java.util.*;

/**
 *
 * @author RayzeR-PC
 */
public class coba_update {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Scanner inputa = new Scanner(System.in);

        try {
            System.out.print("Masukkan NIM : ");
            String NIM = input.nextLine();

            System.out.print("Masukkan Nama Baru : ");
            String nama = input.nextLine();

            System.out.print("Masukkan Umur Baru : ");
            int umur = inputa.nextInt();

            System.out.print("Masukkan Asal Baru : ");
            String asal = input.nextLine();

            koneksi.koneksi();
            Statement st = koneksi.con.createStatement();

            String query = "UPDATE data_mahasiswa SET Nama = '" + nama + "', Umur = " + umur + ", Asal = '" + asal + "' WHERE NIM = '" + NIM + "'";
            if (st.executeUpdate(query) == 1) {
                System.out.println("Sukses Update NIM " + NIM);
            } else {
                System.out.println("Gagal Update NIM " + NIM);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

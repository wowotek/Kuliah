import java.util.Scanner;

/**
 *
 * @author RayzeR-PC
 */
public class contoh_menu {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Scanner inputa = new Scanner(System.in);
        
        while (true) {
            System.out.println("===MENU PERCOBAAN===");
            System.out.println("1. Menu SATU\n"
                            + "2. Menu DUA\n"
                            + "3. Menu TIGA\n"
                            + "4. Keluar\n");
            System.out.print("Masukkan Pilihan : ");
            int pilihan = inputa.nextInt();
            System.out.println();
            switch (pilihan) {
                case 1 :
                    System.out.println("++MENU SATU++");
                    System.out.print("Masukkan Nama : ");
                    String nama = input.nextLine();
                    System.out.println("Nama saya adalah "+nama);
                    break;
                case 2 :
                    System.out.println("++MENU DUA++");
                    System.out.print("Masukkan Umur : ");
                    int umur = inputa.nextInt();
                    System.out.println("Umur saya adalah "+umur);
                    break;
                case 3 :
                    System.out.println("++MENU TIGA++");
                    System.out.print("Masukkan Kalimat : ");
                    String kalimat = input.nextLine();
                    System.out.print("Masukkan Angka : ");
                    int angka = inputa.nextInt();
                    System.out.println("Kalimat = "+kalimat);
                    System.out.println("Angka = "+angka);
                    break;
                case 4 :
                    System.out.println("Terima Kasih!");
                    System.exit(0);
                default :
                    System.out.println("Pilihan Salah!");
            }
            System.out.println();
        }
    }
}

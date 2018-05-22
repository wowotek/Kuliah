package motor;

import java.util.Scanner;

public class Motor {
    private static Kendarai kendaraan = null;

    public static void main (String[] args) {
        Scanner s = new Scanner(System.in);

        String namaMotor;
        System.out.print("Siapa Nama Anda ? ");
        namaMotor = s.nextLine();
        System.out.println("Motor " + namaMotor + " Sekarang Berjalan ke Jalanan !");

        kendaraan = new Kendarai(namaMotor);

        while(true){
            Scanner inputan = new Scanner(System.in);
            System.out.println("Belok Kemana ? ");
            System.out.println("1. Kiri");
            System.out.println("2. Kanan");
            System.out.println("0. Pulang Ke Rumah");
            System.out.print("Pilihan Anda : ");
            
            try {
                int inputanUser = inputan.nextInt();
                kendaraan.belok(inputanUser);
            } catch (Exception ex) {
                System.out.println("Perintah Anda INVALID");
                continue;
            }
        }
    }

}

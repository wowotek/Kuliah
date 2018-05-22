import java.util.Scanner;

public class Motor{
    private static Scanner s = new Scanner(System.in);

    public static void main (String[] args) {
        System.out.print("Siapa Nama Anda ? >> ");
        Kendarai k = new Kendarai(s.nextLine());
        System.out.println("");
        
        while(true){
            System.out.println(k.belok(printMenu()));
        }
    }
    
    private static int printMenu(){
        System.out.println("Pilih Arah belok : ");
        System.out.println("    1. Kiri");
        System.out.println("    2. Kanan");
        System.out.println("");
        System.out.print("Pilih Arah ? >> ");        
        
        switch(s.nextInt()){
            case 1:
                return 1;
            case 2:
                return 2;
            default:
                return 0;
        }
    }    
}

package motor;

public class Kendarai {
    private String namaMotor = null;

    public Kendarai(String namaMotorAnda){
        this.namaMotor = namaMotorAnda;
    }

    public void belok(int arahBelok){
        switch(arahBelok){
            case 1:
                System.out.println("Motor " + this.namaMotor + " Belok Kiri");
                break;
            case 2:
                System.out.println("Motor " + this.namaMotor + " Belok Kanan");
                break;
            case 0:
                System.out.println("Motor " + this.namaMotor + " Sudah Pulang Ke Rumah Dengan Aman ");
                System.out.println("Selamat Tinggal !");
                System.exit(0);
                break;
            default:
                System.out.println("Perintah Anda INVALID");
                break;
        }
    }
}

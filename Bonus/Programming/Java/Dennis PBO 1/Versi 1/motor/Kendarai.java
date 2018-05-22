public class Kendarai {
    public static final int ARAH_KANAN = 2;
    public static final int ARAH_KIRI = 1;

    private String namaMotor = null;

    public Kendarai(String _Nama_Motor){
        this.namaMotor = _Nama_Motor;
    }

    public String belok(int arah){
        if(arah == 1){
            return ("Motor " + this.namaMotor + " Belok Kiri");
        } else if(arah == 2) {
            return ("Motor " + this.namaMotor + " Belok Kanan");
        } else {
            return "INVALID";
        }
    }
}

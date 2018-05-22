import java.util.Scanner;

public class Matrix
{
    private String nama_matrix;
    private int[][] matrix;

    public Matrix(String nama_matrix)
    {
        this.nama_matrix = nama_matrix;
    }

    public void initMatrix(Ordo ordo) 
    {
        Scanner scn = new Scanner(System.in);
        matrix = new int[ordo.getBaris()][ordo.getKolom()];

        System.out.println("=============== Pengisian " + this.nama_matrix + " ===============");
        for(int i=0; i<ordo.getBaris(); i++)
        {
            for(int j=0; j<ordo.getKolom(); j++)
            {
                System.out.print("Masukkan Elemen pada Baris, Kolom ("+ (i + 1) + ", " + (j + 1) + ") : ");
                matrix[i][j] = scn.nextInt();
            }
        }
    }

    public void printMatrix()
    {
        System.out.println("=============== " + this.nama_matrix + " ===============");
        for(int[] i: matrix)
        {
            for(int j: i)
            {
                System.out.print(j + "  ");
            }
            System.out.println();
        }
    }

    public int[][] getMatrix()
    {
        return this.matrix;
    }

    public String getNama()
    {
        return this.nama_matrix;
    }
}

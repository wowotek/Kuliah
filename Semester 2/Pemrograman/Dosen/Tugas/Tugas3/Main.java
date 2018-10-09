class Main
{
    public static void main (String[] args)
    {
        MatrixOperation mo = new MatrixOperation();
        
        Matrix m1 = new Matrix("Matrix ke-1");
        Matrix m2 = new Matrix("Matrix ke-2");
        
        m1.initMatrix(new Ordo(2, 2));
        m2.initMatrix(new Ordo(2, 2));
        
        m1.printMatrix();
        m2.printMatrix();

        mo.addition(m1, m2, true);
        mo.substraction(m1, m2, true);
    }
}

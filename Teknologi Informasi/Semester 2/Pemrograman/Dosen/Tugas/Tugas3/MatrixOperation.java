class MatrixOperation
{
    public int[][] addition(Matrix operand_a, Matrix operand_b, boolean print)
    {
        int[][] a = operand_a.getMatrix();
        int[][] b = operand_b.getMatrix();
        int[][] result = new int[a.length][a[0].length];

        if(print==true)
            System.out.println("=============== Penambahan " + operand_a.getNama() + " dengan " + operand_b.getNama() + " ===============");
        for(int i=0; i<result.length; i++)
        {
            for(int j=0; j<result[i].length; j++)
            {
                result[i][j] = a[i][j] + b[i][j];

                if(print==true)
                    System.out.print(result[i][j] + " ");
            }
            if(print==true)
                System.out.println();
        }

        return result;
    }

    public int[][] substraction(Matrix operand_a, Matrix operand_b, boolean print)
    {
        int[][] a = operand_a.getMatrix();
        int[][] b = operand_b.getMatrix();
        int[][] result = new int[a.length][a[0].length];
        
        if(print==true)
            System.out.println("=============== Pengurangan " + operand_a.getNama() + " dengan " + operand_b.getNama() + " ===============");
        for(int i=0; i<result.length; i++)
        {
            for(int j=0; j<result[i].length; j++)
            {
                result[i][j] = a[i][j] - b[i][j];

                if(print==true)
                    System.out.print(result[i][j] + " ");
            }
            if(print==true)
                System.out.println();
        }

        return result;
    }

    public int[][] transpose(Matrix matrix)
    {
        int[][] m = matrix.getMatrix();
        int[][] result = new int[m.length][m[0].length];

        for(int i=0; i<m.length; i++)
        {
            for(int j=0; j<m[i].length; j++)
            {
                result[i][j] = m[j][i];
            }
        }

        return result;
    }
}

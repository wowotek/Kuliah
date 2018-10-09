package quizasdos;

import java.util.Scanner;

public class Quizasdos
{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)
    {
        Scanner in = new Scanner(System.in);
        String str = in.nextLine();
        char[] chars = str.toCharArray();
        for (int i = 1; i < chars.length; i++)
        {
            if(i % 4 == 0)
            {
                chars[i] = ' ';
            }
        }
        System.out.println(new String(chars));
    }
}

import java.util.*;
import java.io.*;

class Main
{
    public static void main(String[] args)
    {
		try
        {
			File the_file = new File("./InputText.txt");
            String fi_text = new Scanner(the_file).useDelimiter("\\z").next().toLowerCase();
            FileOutputStream fo = new FileOutputStream("./OutputText.txt");
            
            String[] fi_split = fi_text.split("\n");
            StringBuilder final_builder = new StringBuilder();
            String fo_string;
			
			//System.out.println(fi_text);
			//System.out.println(fi_split[1]);

            for(int i=0; i<fi_split.length; i++)
            {
                char[] x = fi_split[i].toCharArray();
                x[0] = Character.toUpperCase(x[0]);
                
                for(int j=0; j<x.length; j++)
                {
                    if(x[j] == ' ')
                    {
                        x[j+1] = Character.toUpperCase(x[j+1]);
                    }
                    //System.out.print(x[j]);
                }
                
                final_builder.append(x);
                final_builder.append("\n");
            }
            
            fo_string = new String(final_builder);
            byte[] fo_byte = fo_string.getBytes();
            
            for(int i=0; i<fo_byte.length; i++)
            {
                fo.write(fo_byte[i]);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
}


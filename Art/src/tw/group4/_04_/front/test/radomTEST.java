package tw.group4._04_.front.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class radomTEST {
	public static void main(String[] args) {
//		int r = 0;
//		r = (int)(Math.random()*10)+1;
//		System.out.println(r);
//		
//		String chars = "ABCDE";
//		int ddd=chars.charAt((int)(Math.random() * 5));
//		System.out.println(ddd);
		
//		int r = 0;
//		r = (int)(Math.random()*10)+1;
//		System.out.println(Alphabet);
		
//		int  result=random.nextInt( 10 );
	
		for (int j = 0; j < 3; j++) {
			
		char Alphabet=(char)(int)(Math.random()*5+65);		
		Random random = new Random();
		String num = "";
		for (int i = 1; i < 2; i++) {
			num += random.nextInt(10)+1;
		}
		String rString=Alphabet+num;
		System.out.println(rString);
		}


		
		
		
		
	}
}

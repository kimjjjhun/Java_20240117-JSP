package ex01;

import java.util.Scanner;


public class 버스요금 {

	public static void main(String[] args) {
	 Scanner sc = new Scanner(System.in);
	 
	 int CHARGE = 1500;
	 double fee=0;
	 
	 System.out.println("나이를 입력하세요.");
	 int age = sc.nextInt();
		 
	 if(age<=65) 
		 fee = CHARGE * 0;
	 else if (age>=20)
		 fee = CHARGE * 1.0;
	 else if(age>=14) 
	    fee = CHARGE * 0.25;
	 else if(age>4) 
		 fee = CHARGE * 0.5;
	 
      System.out.println("당신의 요금은 :" + (int)fee + "원 입니다.");
	 }

	
}


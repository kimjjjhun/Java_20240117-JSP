package ex05;

/*
 *11. 다음은 거스름돈을 몇 개의 동전으로 지불할 수 있는지를 계산하는 문제이다. 변
수 money의 금액을 동전으로 바꾸었을 때 각각 몇 개의 동전이 필요한지 계산해서 출력하
라. 단, 가능한 한 적은 수의 동전으로 거슬러 주어야한다. (1)에 알맞은 코드를 넣어서
프로그램을 완성하시오.
[Hint] 나눗셈 연산자와 나머지 연산자를 사용해야 한다.
 *
 */
public class Exam11 {

	public static void main(String[] args) {
		// 큰 금액의 동전을 우선적으로 거슬러 줘야한다.
		int[] coinUnit =  {500, 100, 50, 10} ;
		int money = 2680;
		System.out.println("money="+money);
		
		for(int i=0;i<coinUnit.length;i++) {  
		/* (1) 알맞은 코드를 넣어 완성하시오.*/
			System.out.println(coinUnit[i]+"원: " + money/coinUnit[i]);
			money = money % coinUnit[i];
		}
	}
}

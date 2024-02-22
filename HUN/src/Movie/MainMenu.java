package Movie;

public class MainMenu extends AbstractMenu{  // AbstractMenu를 상속받음(자식클래스)
	
	@Override
	public Menu next() {
		switch(sc.nextLine()) {
		case "1":
			reserve();            // 영화예매
			return this;
		case "2":
			checkReservation();  //예매확인
			return this;
		case "3":
			cancelReservation();  // 예매취소
			return this;
		case "4":
			
		case "5":
		}
		
		return super.next();
	}
	private void cancelReservation() {
	}

	private void checkReservation() {
	}
	
	private void reserve() {
		
			
		
}

	private static final String MAIN_MENU_TEXT =
           			"1: 영화 예매하기\n" +
					"2: 예매 확인하기\n" +
					"3: 예매 취소하기\n" +
					"4: 관리자 메뉴\n" +
					"5: 종료\n\n" +
					"메뉴를 선택하세요: ";

}

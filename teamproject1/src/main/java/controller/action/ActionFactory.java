package controller.action;

import controller.action.MemberInsertAction;
import controller.action.MemberInsertActionForm;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {}
	
	public static ActionFactory getInstance() {
		return instance;
	}
							
	public Action getAction(String command) {
		Action action = null;
		
		System.out.println("ActionFactory :" + command);
		
		//조건식 나열 --> Action 구현 클래스
		
			
		if(command.equals("member_login_form")) {
			action = new MemberLoginActionForm();
		}else if(command.equals("member_insert_form")) {
			action = new MemberInsertActionForm();
		}else if(command.equals("member_insert")) {
			action = new MemberInsertAction();
		}else if(command.equals("member_idcheck_form")) {
			action = new MemberIdcheckFormAction();
		}else if(command.equals("idCheck")) {
			action = new MemberIdcheckAction();
		}else if(command.equals("member_login")) {
			action = new MemberLoginAction();
		}else if(command.equals("member_findid_form")) {
			action = new MemberFindidFormAction();
		}else if(command.equals("member_findid")) {
			action = new MemberFindidAction();
		}else if(command.equals("member_findpw_form")) {
			action = new MemberFindpwFormAction();
		}else if(command.equals("member_findpw")) {
			action = new MemberFindpwAction();
		}else if(command.equals("member_findid_after_form")) {
			action = new MemberFindidAfterFormAction();
		}
		
		return action;
	}
}
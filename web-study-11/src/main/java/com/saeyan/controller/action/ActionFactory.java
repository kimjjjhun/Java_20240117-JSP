package com.saeyan.controller.action;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {}
	
	public static ActionFactory getInstance() {
		return instance;
	}
							//Board_list
	public Action getAction(String command) {
		Action action = null;
		
		System.out.println("ActionFactory :" + command);
		
		//조건식 나열 --> Action 구현 클래스
		
			//command=board_list
		if(command.equals("board_list")) {
			action = new BoardListAction();
			//command=board_write_form
		}else if(command.equals("board_write_form")) {
			action = new BoardWriteActionForm();
			//command=board_write
		}else if(command.equals("board_write")) {
			action = new BoardWriteAction();
			//command=board_view	
		}else if(command.equals("board_view")) {
			action = new BoardViewAction();
			//command=board_check_pass_fom	
		}else if(command.equals("board_check_pass_form")) {
			action = new BoardCheckPassFormAction();
			//command=board_check_pass	
		}else if(command.equals("board_check_pass")) {
			action = new BoardCheckPassAction();
			//command=board_update_form	
		}else if(command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();
			//command=board_update
		}else if(command.equals("board_update")) {
			action = new BoardUpdateAction();
			//command=board_delete
		}else if(command.equals("board_delete")) {
			action = new BoardDeleteAction();
		}
		
		return action;
	}
}

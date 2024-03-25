package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardCheckPassFormAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/board/boardCheckPass.jsp";
		
		request.getRequestDispatcher(url)
		.forward(request, response);
	}

}

package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO.getInstance().deleteBoard(num);
		
		response.sendRedirect("BoardServlet?command=board_list");
		
	}

}

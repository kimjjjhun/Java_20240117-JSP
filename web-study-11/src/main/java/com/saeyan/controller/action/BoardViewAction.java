package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardViewAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상세페이지를 보여줌
		int num = Integer.parseInt(request.getParameter("num"));
	
		BoardVO vo = BoardDAO.getInstance().selectBoardByNum(num);
		
		request.setAttribute("board", vo);
		
		String url = "board/boardView.jsp";
		
		request.getRequestDispatcher(url)
		.forward(request, response);
	}

}

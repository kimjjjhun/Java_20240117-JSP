package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardUpdateFormAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/board/boardUpdate.jsp";
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		BoardVO vo = bDao.selectBoardByNum(num);
		
		BoardDAO.getInstance().updateReadCount(num);
		
		request.setAttribute("board", vo);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}

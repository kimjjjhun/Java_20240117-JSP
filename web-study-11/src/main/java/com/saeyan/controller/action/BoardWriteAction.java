package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardWriteAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글자깨짐방지
		request.setCharacterEncoding("utf-8");
		//텍스트 글자깨짐방지
		response.setContentType("text/html; charset=utf-8");
		
		BoardVO vo = new BoardVO();
		//vo에 값을 저장
		vo.setName(request.getParameter("name"));
		vo.setPass(request.getParameter("pass"));
		vo.setEmail(request.getParameter("email"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		
		//db에 저장
		BoardDAO.getInstance().insertBoard(vo);
		//저장하고 board_list 화면으로 전환시켜주는 문구
		response.sendRedirect("BoardServlet?command=board_list");
		
		//new BoardListAction().execute(request,response);
		//위와 같은 문장 저장하고 board_list로 화면 전환
	}

}

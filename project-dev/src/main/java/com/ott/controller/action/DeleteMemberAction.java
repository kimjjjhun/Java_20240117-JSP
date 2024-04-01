package com.ott.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ott.dao.MemberDAO;
import com.ott.dto.MemberVO;

public class DeleteMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO vo  = (MemberVO)session.getAttribute("member");
		String userId = vo.getUserId();
		System.out.println("테스트");
		System.out.println("테스트아이디>>" + userId);
		MemberDAO.getInstance().deleteMember(userId);
		
		request.getRequestDispatcher("member/MemberLogin.jsp").forward(request, response);

	}

}
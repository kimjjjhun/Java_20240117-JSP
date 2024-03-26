package com.ott.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ott.dao.MemberDAO;



public class KakaoLoginFormAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		boolean emailExists = checkEmailExistsInDB(email);
		if(emailExists) {
			response.sendRedirect("loginSusess.jsp");
		}else {
			response.sendRedirect("OttServlet?command=member_insert_form");
		}
			
		System.out.println("email>>" + email);
		
		/*
		 * request.getRequestDispatcher("member/loginSusess.jsp") .forward(request,
		 * response);
		 */
	}
	
	private boolean checkEmailExistsInDB(String email) {
		return MemberDAO.getInstance().checkEmailExists(email);
	}

}

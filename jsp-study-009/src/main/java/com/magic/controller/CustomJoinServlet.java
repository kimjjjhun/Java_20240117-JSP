package com.magic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.magic.dao.EmployeesDAO;
import com.magic.dto.EmployeesVO;


@WebServlet("/custom.do")
public class CustomJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String url = "employees/customJoin.jsp";
		
		request.getRequestDispatcher(url)
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		EmployeesVO vo = new EmployeesVO();
		vo.setId(request.getParameter("id"));
		vo.setPass(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setLev(request.getParameter("lev"));
		vo.setGender(Integer.parseInt(request.getParameter("gender")));
		vo.setPhone(request.getParameter("phone"));
		
		EmployeesDAO eDao = EmployeesDAO.getInstance();
		eDao.insertEmployee(vo);
		
		request.setAttribute("member",eDao);
		request.setAttribute("message","회원가입을 축하드립니다.");
		
		request.getRequestDispatcher("employees/joinsuccess.jsp")
		.forward(request, response);
	}

}

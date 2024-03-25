package com.magic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.magic.dao.EmployeesDAO;
import com.magic.dto.EmployeesVO;

@WebServlet("/mypage.do")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		EmployeesVO emp = (EmployeesVO) session.getAttribute("loginUser");
		//회원정보값이없으면 로그인하러 가라는 문장
		if (emp != null) {
			//회원정보값이있으면 mypage 이동
			request.getRequestDispatcher("employees/mypage.jsp").forward(request, response);
			//회원정보값이없으면 login.do 이동
		} else {
			response.sendRedirect("login.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글깨짐방지
		request.setCharacterEncoding("utf-8");
		// post방식으로 정보를 가져오기위해
		// 객체생성
		EmployeesVO vo = new EmployeesVO();
		// 생성한 vo객체에 정보를 수정
		vo.setId(request.getParameter("id"));
		vo.setPass(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setLev(request.getParameter("lev"));
		vo.setGender(Integer.parseInt(request.getParameter("gender")));
		vo.setPhone(request.getParameter("phone"));
		
		EmployeesDAO eDao = EmployeesDAO.getInstance();
		HttpSession session = request.getSession();
		String url = null;
		int result = eDao.updateEmployee(vo);
		
		if(result == 1) {
			vo = eDao.getMember(vo.getId());
			request.setAttribute("message","회원정보가 수정되었습니다.");
			//수정후 메시지 출력
			request.setAttribute("member",vo);
			//수정된 내용 출력
			session.setAttribute("loginUser",vo);
			result = eDao.userCheck(vo.getId(),vo.getPass(),vo.getLev());
			request.setAttribute("result",result);
			url = "employees/joinsuccess.jsp";
		}
		request.getRequestDispatcher(url)
		.forward(request, response);
	}

}

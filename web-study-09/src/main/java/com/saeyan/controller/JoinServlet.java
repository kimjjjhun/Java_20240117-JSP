package com.saeyan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;

import com.saeyan.dao.MemberDAO;
import com.saeyan.dto.MemberVO;


@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("member/join.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글깨짐방지
		request.setCharacterEncoding("utf-8");
		//getparameter로 값을 post방식으로 받아온다.
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String admin = request.getParameter("admin");
		//MemberVO를 참조하는 새로운 vo객체를 생성
		MemberVO vo = new MemberVO();
		//MemberVO를 참조하는 vo객체에 아래의값들을 setter를 사용해 값을 넣는다.
		vo.setName(name);
		vo.setUserid(userid);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setPhone(phone);
		vo.setAdmin(Integer.parseInt(admin));
		
		MemberDAO mDao = MemberDAO.getInstance();

		int result = mDao.insertMember(vo);
		
//	    PrintWriter out = response.getWriter();
//		
//		out.print("<html><head></head><body>");
//		out.print(result);
//		out.print("</body></html>");
		
		HttpSession session = request.getSession();
		if(result == 1) {
			//회원가입성공
			session.setAttribute("userid",userid);
			request.setAttribute("message","회원가입을 축하드립니다.");
		}else{
			//회원가입 실패
			request.setAttribute("message","회원가입에 실패했습니다.");
		}
		
		request.getRequestDispatcher("member/login2.jsp")
			.forward(request, response);
		
	}

}

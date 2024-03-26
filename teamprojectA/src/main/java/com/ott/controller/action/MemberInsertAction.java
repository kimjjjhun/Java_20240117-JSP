	package com.ott.controller.action;
	
	
	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

import com.ott.dao.MemberDAO;
import com.ott.dto.MemberVO;
	
	
	public class MemberInsertAction implements Action {
	
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			
			response.setContentType("text/html; charset=utf-8");
			
			
			// 주소와 상세주소를 합쳐서 하나의 주소로 저장합니다.
	        String address = request.getParameter("address");
	        String detailAddress = request.getParameter("detailAddress");
	        String addressnum = request.getParameter("addressnum");
	        System.out.println(detailAddress);
	        String fullAddress = addressnum + " " + address + " " + detailAddress;
	        
	        System.out.println("fullAddress>" + fullAddress);
	        
			
	        MemberVO mVo = new MemberVO();
	        
	        mVo.setUserId(request.getParameter("userid"));
	        mVo.setName(request.getParameter("name"));
	        mVo.setPwd(request.getParameter("pwd"));
	        mVo.setEmail(request.getParameter("email"));
	        mVo.setPhone(request.getParameter("phone"));
	        mVo.setAddress(fullAddress);
			System.out.println("mVo>>" + mVo);
			int result = MemberDAO.getInstance().insertMember(mVo);
			HttpSession session = request.getSession();
			if(result == 1) {
				session.setAttribute("member",mVo);
				request.setAttribute("message","회원가입을 축하드립니다.");
				
				response.sendRedirect("OttServlet?command=member_login_form");
			} else {
				request.setAttribute("message","회원가입에 실패했습니다.");
			}
		}
	}

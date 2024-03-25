	package controller.action;
	
	import java.io.IOException;
	
	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	
	import dao.MemberDAO;
	import dto.MemberVO;
	
	public class MemberInsertAction implements Action {
	
		@Override
		public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			
			response.setContentType("text/html; charset=utf-8");
			
			MemberVO mVo = new MemberVO();
			
			mVo.setUserid(request.getParameter("userid"));
			mVo.setName(request.getParameter("name"));
			mVo.setPwd(request.getParameter("pwd"));
			mVo.setEmail(request.getParameter("email"));
			mVo.setPhone(request.getParameter("phone"));
			mVo.setAddress(request.getParameter("address"));
			
			
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

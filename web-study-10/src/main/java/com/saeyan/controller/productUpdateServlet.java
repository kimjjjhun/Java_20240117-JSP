package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.saeyan.dao.ProductDAO;
import com.saeyan.dto.ProductVO;

@WebServlet("/productUpdate.do")
public class productUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String code;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int code = Integer.parseInt(request.getParameter("code"));
		//싱글톤패턴을 가져다 쓴다.
		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO vo = pDao.selectProductByCode(code);
		
		request.setAttribute("product",vo);
		
		String url ="product/productUpdate.jsp";
		request.getRequestDispatcher(url)
		.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		ServletContext context = getServletContext();
		String path = context.getRealPath("upload");
		String encType = "utf-8";
		
		int sizeLimit = 20*1024*1024;
		MultipartRequest multi = new MultipartRequest(
				request, path, sizeLimit,encType, new DefaultFileRenamePolicy());
		
		String code = multi.getParameter("code");
		String name = multi.getParameter("name");
		String description = multi.getParameter("description");
		String price = multi.getParameter("price");
		String pictureUrl = multi.getFilesystemName("pictureUrl");
		
		//기존이미지를 값을 안넣을경우 사용하겠다는 문장
		if(pictureUrl == null) {
			pictureUrl = multi.getParameter("nonmakeImg");
		}
		
		ProductVO vo = new ProductVO();
		
		vo.setCode(Integer.parseInt(code));
		vo.setName(name);
		vo.setPrice(Integer.parseInt(price));
		vo.setDescription(description);
		vo.setPictureUrl(pictureUrl);
		
		ProductDAO.getInstance().updateProduct(vo);
		
		response.sendRedirect("productList.do");
	}

}

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

@WebServlet("/productWrite.do")
public class productWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("product/productWriter.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String savePath = "upload";
		ServletContext context = getServletContext();
		String path = context.getRealPath(savePath);
		System.out.println("저장경로 : " + path);
	
		String encType = "utf-8";
		int sizeLimit = 20*1024*1024; //최대 2MB전송
		
		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				sizeLimit,
				encType,
				new DefaultFileRenamePolicy());
		String name = multi.getParameter("name");
		int price = Integer.parseInt(multi.getParameter("price"));
		String description = multi.getParameter("description");		
		String pictureUrl = multi.getFilesystemName("pictureUrl");
	
		ProductVO vo = new ProductVO();
		vo.setName(name);
		vo.setPrice(price);
		vo.setDescription(description);
		vo.setPictureUrl(pictureUrl);
		
		ProductDAO pDao = ProductDAO.getInstance();
		pDao.insertProduct(vo); //저장
	}

}

package com.saeyan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.ProductDAO;
import com.saeyan.dto.ProductVO;

@WebServlet("/productDelete.do")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String code = request.getParameter("code");
		ProductVO vo = ProductDAO.getInstance().selectProductByCode(Integer.parseInt(code));
		request.setAttribute("product",vo);
		request.getRequestDispatcher("product/productDelete.jsp")
		.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int code = Integer.parseInt(request.getParameter("code"));
		
		ProductDAO.getInstance().deleteProduct(code);
		
		response.sendRedirect("productList.do");
		
	}

}

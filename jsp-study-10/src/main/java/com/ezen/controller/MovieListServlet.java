package com.ezen.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ezen.dao.MovieDAO;
import com.ezen.dto.MovieVO;

@WebServlet("/movieList.do")
public class MovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		/*
		 * MovieDAO mDao = MovieDAO.getInstance(); List<MovieVO> list =
		 * mDao.GetmovieList();
		 */
		List<MovieVO> list = MovieDAO.getInstance().GetmovieList();
		
		request.setAttribute("movieList",list);
		String url = "movie/movieList.jsp";
		/*
		 * RequestDispatcher dis = request.getRequestDispatcher(url);
		 * dis.forward(request, response);
		 */
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.ezen.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ezen.dao.MovieDAO;
import com.ezen.dto.MovieVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/movieupdate.do")
public class MovieUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		MovieVO vo = MovieDAO.getInstance().getOneMovie(code);
		
		request.setAttribute("move",vo);
		
		request.getRequestDispatcher("movie/movieUpdate.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ServletContext context = getServletContext();
		String path = context.getRealPath("upload");
		System.out.println("realPath : " + path);
		
		String encType = "utf-8";
		int sizeLimit = 20*1024*1024;
		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				sizeLimit,
				encType,
				new DefaultFileRenamePolicy()
				);
		String code = multi.getParameter("code");
		String title = multi.getParameter("title");
		String price = multi.getParameter("price");
		String director = multi.getParameter("director");
		String actor = multi.getParameter("actor");
		String synopsis = multi.getParameter("synopsis");
		String fileName = multi.getFilesystemName("poster");
		
		//이미지를 변경하면 poster 이미지 , 변경안하면 nonmakeImg를 사용한다.
		if(multi.getFilesystemName("poster") == null) {
			fileName = multi.getFilesystemName("nonmakeImg");
		}else {
			fileName = multi.getFilesystemName("poster");
		}
		
		MovieVO vo = new MovieVO();
		vo.setCode(Integer.parseInt(code));
		vo.setTitle(title);
		vo.setPrice(Integer.parseInt(price));
		vo.setDirector(director);
		vo.setActor(actor);
		vo.setPoster(fileName);
		vo.setSynopsis(synopsis);
		
		MovieDAO.getInstance().updateMovie(vo);
		response.sendRedirect("movieList.do");
	}
	}



package unit02;

import java.io.IOException;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddtionServlet02")
public class AddtionServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Scanner sc = new Scanner(System.in);

		int n1 = 20;
		int n2 = 10;
		int add = n1+n2;
		String name = sc.nextLine();
		
		
		request.setAttribute("num1", n1);
		request.setAttribute("num2", n2);
		request.setAttribute("add", add);
		request.setAttribute("name", name);
		
		//forward 방식
		RequestDispatcher dispatcher = request.getRequestDispatcher("addition03.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

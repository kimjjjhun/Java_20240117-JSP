package unit_10;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.connector.Response;


@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String job = request.getParameter("job");
		   String interests[] = request.getParameterValues("interest");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

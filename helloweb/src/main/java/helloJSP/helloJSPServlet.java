package helloJSP;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * implementation class helloJSPServlet
 */
@WebServlet(description = "처음만들어봄", urlPatterns = { "/helloJSPServlet" })
public class helloJSPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 컨텐츠 타입 선언 및 한글 설
		response.setContentType("text/html;charset=UTF-8");
		// 웹브라우저출력을 위한 PrintWriter 객체 
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<body><h2>hello Servlet 호출성공!! </h2><body>");
		out.println("</HTML>");
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

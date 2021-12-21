package Controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		session.invalidate();
		if(request.getQueryString().length() > 10) {
			RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/trangchu.jsp");
			rd.forward(request, response);
		}else {
			//Cookie cookie1 = null;
			Cookie cookie = null;
			//xóa cookie
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for (int i = 0; i < cookies.length; i++){
		            	cookie=new Cookie(cookies[i].getName(),null);
				}
		            
			}
			
	        //set thời gian sống ngay lập tức
	        cookie.setMaxAge(0);
	        response.addCookie(cookie);
			
	        //về lại trang chủ
			response.sendRedirect(this.getServletContext().getContextPath() + "/TrangChu");
		}
	}

}

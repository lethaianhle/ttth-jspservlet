package Controllers;

import java.io.IOException;
import Controllers.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Account;
import DAO.AccountDAO;

@WebServlet("/Register_account")
public class Register_account extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register_account() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/Register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		//Lấy thông tin request
		String accountname=escapeHTML(request.getParameter("username1")); 
		String password= escapeHTML(request.getParameter("password0")); 
		String name=escapeHTML(request.getParameter("name"));
		String birthday=escapeHTML(request.getParameter("birthday"));
		String sex=escapeHTML(request.getParameter("sex"));
		String mail=escapeHTML(request.getParameter("email"));
		String phonenumber=escapeHTML(request.getParameter("phonenumber"));
		
		Account acc=new Account();
		acc.setAccountname(accountname);
		acc.setPassword(password);
		acc.setName(name);
		
		acc.setBirthday(birthday);
		acc.setPhonenumber(phonenumber);
		acc.setSex(sex);
		acc.setMail(mail);
		
		if(AccountDAO.Insert_Account(acc))
		{
			request.setAttribute("errorStr","Đăng ký thành công vui lòng đăng nhập lại !!!");
			RequestDispatcher dispatcher //
            = this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "/TrangChu");
		}
		
	}
	
	public static String escapeHTML(String s){
	    int length = s.length();
	    int newLength = length;
	    boolean someCharacterEscaped = false;
	    // first check for characters that might
	    // be dangerous and calculate a length
	    // of the string that has escapes.
	    for (int i=0; i<length; i++){
	      char c = s.charAt(i);
	      int cint = 0xffff & c;
	      if (cint < 32){
	        switch(c){
	          case '\r':
	          case '\n':
	          case '\t':
	          case '\f':{
	          } break;
	          default: {
	            newLength -= 1;
	            someCharacterEscaped = true;
	          }
	        }
	      } else {
	        switch(c){
	          case '\"':{
	            newLength += 5;
	            someCharacterEscaped = true;
	          } break;
	          case '&':
	          case '\'':{
	            newLength += 4;
	            someCharacterEscaped = true;
	          } break;
	          case '<':
	          case '>':{
	            newLength += 3;
	            someCharacterEscaped = true;
	          } break;
	        }
	      }
	    }
	    if (!someCharacterEscaped){
	      // nothing to escape in the string
	      return s;
	    }
	    StringBuffer sb = new StringBuffer(newLength);
	    for (int i=0; i<length; i++){
	      char c = s.charAt(i);
	      int cint = 0xffff & c;
	      if (cint < 32){
	        switch(c){
	          case '\r':
	          case '\n':
	          case '\t':
	          case '\f':{
	            sb.append(c);
	          } break;
	          default: {
	            // Remove this character
	          }
	        }
	      } else {
	        switch(c){
	          case '\"':{
	            sb.append("&quot;");
	          } break;
	          case '\'':{
	            sb.append("&#39;");
	          } break;
	          case '&':{
	            sb.append("&amp;");
	          } break;
	          case '<':{
	            sb.append("&lt;");
	          } break;
	          case '>':{
	            sb.append("&gt;");
	          } break;
	          default: {
	            sb.append(c);
	          }
	        }
	      }
	    }
	    return sb.toString();
	  }

}

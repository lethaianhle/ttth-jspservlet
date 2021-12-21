package Controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.comment;
import Bean.discussion;
import DAO.loadDiscussionDAO;
import DBConnection.DBConnection;

@WebServlet("/user_thaoluan_baiviet")
public class user_thaoluan_baiviet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public user_thaoluan_baiviet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Connection conn = DBConnection.CreateConnection();
			String discussionID = escapeHTML(request.getParameter("discussionID"));
			String Stitle = escapeHTML(request.getParameter("Stitle"));
			int role = Integer.parseInt(request.getParameter("role"));
			
			System.out.println(discussionID);
			discussion c = new discussion();
			
			
			c = loadDiscussionDAO.LoadDiscussionInfo(discussionID, conn);
			List<comment> listComment = loadDiscussionDAO.LoadListComments(discussionID, conn);
			
			
			request.setAttribute("discussionInfo", c);
			request.setAttribute("listComment", listComment);
			request.setAttribute("Stitle", Stitle);
			request.setAttribute("discussionID", discussionID);
			
			if(role == 1) {
				RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_baiviet.jsp");
				rd.forward(request, response);
			}
			else if(role == 2) {
				RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_baiviet2.jsp");
				rd.forward(request, response);
			}
			else if(role == 3) {
				RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_baiviet3.jsp");
				rd.forward(request, response);
			}
			else if(role == 4) {
				RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_baiviet4.jsp");
				rd.forward(request, response);
			}
			else if(role == 5) {
				RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_baiviet5.jsp");
				rd.forward(request, response);
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

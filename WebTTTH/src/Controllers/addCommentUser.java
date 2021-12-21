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
import DAO.editDiscussionDAO;
import DAO.loadDiscussionDAO;
import DBConnection.DBConnection;

@WebServlet("/addCommentUser")
public class addCommentUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addCommentUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		
		String discussionID = request.getParameter("discussionID");
		String Stitle = request.getParameter("Stitle");
		int role = Integer.parseInt(request.getParameter("role"));
		String accountID = request.getParameter("accountID");
		String message = request.getParameter("message");
		
		comment d = new comment();
		d.setAccount_id(Integer.parseInt(accountID));
		d.setDiscussion_id(Integer.parseInt(discussionID));
		d.setComment(message);
		editDiscussionDAO.InsertComment(d, conn);
		
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

}

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

import Bean.discussion;
import Bean.user;
import DAO.loadDiscussionDAO;
import DBConnection.DBConnection;

@WebServlet("/user_thaoluan_goccongnghe")
public class user_thaoluan_goccongnghe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public user_thaoluan_goccongnghe() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Connection conn = DBConnection.CreateConnection();
			
			if(request.getParameter("topicID").length() > 10) {
				RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/Login.jsp");
				rd.forward(request, response);
			}else {
				int topicID = Integer.parseInt(request.getParameter("topicID"));
				
				List<discussion> listDiscussion = loadDiscussionDAO.LoadListDiscussion(topicID, conn);
				List<user> listAccDiscussion = loadDiscussionDAO.LoadListAccountDiscussion(topicID, conn);
				
				request.setAttribute("listDiscussion", listDiscussion);
				request.setAttribute("listAccDiscussion", listAccDiscussion);
				
				if(topicID == 6) {
					RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_goccongnghe.jsp");
					rd.forward(request, response);
				}
				else if(topicID == 7) {
					RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_goccongnghe2.jsp");
					rd.forward(request, response);
				}
				else if(topicID == 8) {
					RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/user_thaoluan_goccongnghe3.jsp");
					rd.forward(request, response);
				}
			}
	}

}
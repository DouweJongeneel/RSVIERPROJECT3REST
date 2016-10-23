package controllers;

import beans.entity.User;
import beans.session.UserFacade;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by douwejongeneel on 17/10/2016.
 */

@WebServlet("/loginServlet")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1l;

    @EJB
    UserFacade userFacade;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<User> tempUser = userFacade.withNamedQuery("User.findByUsernameAndPassword", new String[] {"username", "password"}, new String[] {username, password});

        if (tempUser.size() == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("user", tempUser.get(0));
            session.setMaxInactiveInterval(30*60); //Session expires after 30 mins
            Cookie userName = new Cookie("user", username);
            userName.setMaxAge(30*60);
            response.addCookie(userName);
            response.sendRedirect(request.getContextPath() + "/home");
        }
        else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login");
            PrintWriter out = response.getWriter();
            out.println("<font color=red>Either username of password is incorrect.</font>");
            rd.include(request, response);
        }
    }
}

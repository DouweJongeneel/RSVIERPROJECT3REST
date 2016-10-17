package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by douwejongeneel on 07/10/2016.
 */

@WebServlet(name = "ServletController", loadOnStartup = 1, urlPatterns = {"/login", "/home", "/activities", "/activities/register", "/register/user", "/register/company"})
public class ServletController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userPath = request.getServletPath();


        // Send to login
        if (userPath.equals("/login")) {
            userPath = "/login";
        }
        // Send to homepage
        else if (userPath.equals("/home")) {
            userPath = "/home";
        }

        // Send to activities page
        else if (userPath.equals("/activities")) {
            userPath = "/activity/activityHome";
        }

        // Send to activities registration page
        else if (userPath.equals("/activities/register")) {
            userPath = "/activity/registerActivity";

        }
        // Send to user registration page
        else if (userPath.equals("/register/user")) {
            userPath = "/user/userRegistrationForm";
        }

        // Use RequestDispatcher to forward request internally
        String url = "/WEB-INF/views" + userPath + ".jsp";

        getRequestDispatcherAndForwardInternally(request, response, url);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userPath = request.getServletPath();

        if (userPath.equals("/blabla")) {
            userPath = "/blabla";
        }

        // Use RequestDispatcher to forward request internally
        String url = "/WEB-INF/views" + userPath + ".jsp";

        getRequestDispatcherAndForwardInternally(request, response, url);

    }

    public void getRequestDispatcherAndForwardInternally(HttpServletRequest request, HttpServletResponse response, String url) {
        try {
            request.getRequestDispatcher(url).forward(request, response);
        }
        catch (IOException ex) {
            ex.printStackTrace();
        }
        catch (ServletException ex) {
            ex.printStackTrace();
        }
    }

}

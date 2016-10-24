package controllers;

import beans.entity.Activity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by douwejongeneel on 07/10/2016.
 */

@WebServlet(name = "ServletController", loadOnStartup = 1, urlPatterns = {"/login", "/home", "/activities", "/activities/activity/*", "/activities/modify/*" ,"/activities/register", "/activities/admin",
                                                                            "/users/admin" , "/register/user",
                                                                            "/register/company"
                                                                            })
public class ServletController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userPath = request.getServletPath();


        // Send to login
        if (userPath.equals("/login")) {
            userPath = "/login/login";
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

        // send to activity page by id
        else if (userPath.equals("/activities/activity")) {
            userPath = "/activity/activity";
            request = getIdFromRequestAndAddAsAttributeToRequest(request);
        }

        else if (userPath.equals("/activities/modify")) {
            userPath = "/activity/modifyActivity";
            request = getIdFromRequestAndAddAsAttributeToRequest(request);
        }

        else if (userPath.equals("/activities/admin")) {
            userPath = "/activity/activityList";
        }

        else if (userPath.equals("/users/admin")) {
            userPath = "/user/userList";
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

    public HttpServletRequest getIdFromRequestAndAddAsAttributeToRequest(HttpServletRequest request) {
        // Get activity id from request, get rid of the / and put id in request attribute
        String id = request.getPathInfo();
        String[] tokens = id.split("/");
        request.setAttribute("id", tokens[1]);
        return request;
    }

}

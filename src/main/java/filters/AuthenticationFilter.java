package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by douwejongeneel on 17/10/2016.
 */

@WebServlet("/authenticationFilter")
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig fconfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();

        HttpSession session = req.getSession(false);

        if (session == null && !(uri.endsWith("html")) || uri.endsWith("loginServlet")) {
            res.sendRedirect(req.getContextPath() + "/login");
        }
        else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy(){
    }
}

package rest.resources;

import beans.entity.Invoice;
import beans.entity.User;
import beans.session.ActivityFacade;
import beans.session.InvoiceFacade;
import beans.session.UserFacade;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;

/**
 * Created by douwejongeneel on 25/10/2016.
 */
@Path("/orders")
@Produces(MediaType.APPLICATION_JSON)
public class OrderResource {

    @EJB
    private InvoiceFacade invoiceFacade;

    @EJB
    private UserFacade userFacade;

    @EJB
    private ActivityFacade activityFacade;

    @POST
    @Path("/tickets")
    @Consumes({MediaType.APPLICATION_FORM_URLENCODED})
    public void procesUserOrder(@FormParam("ticketsOrdered") Integer ticketsOrdered, @Context HttpServletRequest request) {

        request.setAttribute("ticketsOrdered", ticketsOrdered);

    }

    public User getUserFromSession(HttpServletRequest request) {
        // Get the user from the session
        HttpSession session = request.getSession();
        return (User) session.getAttribute("user");
    }
}

package rest.resources;

import beans.entity.User;
import beans.session.UserFacade;

import javax.ws.rs.*;
import javax.ejb.EJB;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import java.util.List;

/**
 * Created by douwejongeneel on 30/09/2016.
 */

@Path("/users")
public class UserResource {

    @EJB
    private UserFacade userFacade;

    @GET
    @Produces(MediaType.TEXT_HTML)
    public String getAllUsers(){
        return "<html> " + "<title>" + "RESTFul" + "</title>" +
                "<body><h1>" + "Return all Users!" + "</body></h1>" + "</html> ";
    }

    @GET
    @Path("/{userId}")
    @Produces(MediaType.TEXT_HTML)
    public String getUserById(@PathParam("userId") Long id) {
        return "<html> " + "<title>" + "RESTFul" + "</title>" +
                "<body><h1>" + "Return a User!" + "</body></h1>" + "</html> ";
    }

    @GET
    @Path("/register/{user}")
    @Produces(MediaType.TEXT_HTML)
    public String registerUser(@PathParam("user") String user) {
        return "<html> " + "<title>" + "RESTFul" + "</title>" +
                "<body><h1>" + "Register a User!" + "</body></h1>" + "</html> ";
    }

    @GET
    @Path("/update/{userId}")
    @Produces(MediaType.TEXT_HTML)
    public String updateUserById(@PathParam("userId") Long id) {
        return "<html> " + "<title>" + "RESTFul" + "</title>" +
                "<body><h1>" + "Update a User!" + "</body></h1>" + "</html> ";
    }

}

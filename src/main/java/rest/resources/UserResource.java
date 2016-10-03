package rest.resources;

import beans.entity.User;
import beans.session.UserFacade;

import javax.ws.rs.*;
import javax.ejb.EJB;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


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
    @Produces(MediaType.APPLICATION_JSON)
    public User getUserById(@PathParam("userId") Long id) {
        User user = new User("Douwe", "Jongeneel", "douwe@jongeneel.com", "1234", "ADMIN");
        return user;
    }

    @POST
    @Path("/register/{user}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response registerUser(@PathParam("user") String user) {
        String result = "Record entered: " + user;
        return Response.status(201).entity(result).build();
    }

    @POST
    @Path("/update/{userId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateUserById(@PathParam("userId") Long id) {
        String result = "Record updated: " + id;
        return Response.status(201).entity(result).build();
    }

}

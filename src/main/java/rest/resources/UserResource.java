package rest.resources;

import beans.entity.User;
import beans.session.UserFacade;

import javax.ws.rs.*;
import javax.ejb.EJB;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.Date;
import java.util.List;


/**
 * Created by douwejongeneel on 30/09/2016.
 */

@Path("/users")
@Produces(MediaType.APPLICATION_JSON) // <-- default van alle methodes voor deze klasse
public class UserResource {

    @EJB
    private UserFacade userFacade;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<User> getAllUsers(){
        return userFacade.findAll();
    }

    @GET
    @Path("/{userId}")
//    @Produces(MediaType.APPLICATION_JSON)
    public User getUserById(@PathParam("userId") Long id) {
        return userFacade.find(id);
    }

    @POST
    @Path("/register")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public void registerUser(@FormParam("firstname") String firstname,
                             @FormParam("insertion") String insertion,
                             @FormParam("lastname") String lastname,
                             @FormParam("phone") Integer phone,
                             @FormParam("email") String email,
                             @FormParam("password") String password,
                             @DefaultValue("USER") @FormParam("role") String role) {

        // create a new user and save form data
        User user = new User();
        user.setFirstname(firstname);
        if (insertion != null) {
            user.setInsertion(insertion);
        }
        user.setLastname(lastname);
        if (phone != null) {
            user.setPhone(phone);
        }
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);

        // Register the new user with the persistence context and database
        userFacade.create(user);

    }

    @POST
    @Path("/update/{userId}")
    @Consumes("application/x-www-form-urlencoded")
    public void updateUserById(@FormParam("firstname") String firstname,
                               @FormParam("insertion") String insertion,
                               @FormParam("lastname") String lastname,
                               @FormParam("phone") Integer phone,
                               @FormParam("email") String email,
                               @FormParam("password") String password) {

        User updateUser = new User();
        updateUser.setFirstname(firstname);
        if (insertion != null) {
            updateUser.setInsertion(insertion);
        }
        updateUser.setLastname(lastname);
        if (phone != null) {
            updateUser.setPhone(phone);
        }
        updateUser.setEmail(email);
        updateUser.setPassword(password);

        // Update user with persistence context and database
        userFacade.edit(updateUser);
    }

}

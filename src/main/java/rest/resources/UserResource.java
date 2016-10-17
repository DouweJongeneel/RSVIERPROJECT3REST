package rest.resources;

import beans.entity.Address;
import beans.entity.User;
import beans.session.UserFacade;

import javax.ws.rs.*;
import javax.ejb.EJB;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.Collection;
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
                             @FormParam("phone") String phone,
                             @FormParam("email") String email,
                             @FormParam("password") String password,
                             @FormParam("route") String street,
                             @FormParam("street_number") String streetNumber,
                             @FormParam("postal_code") String postalCode,
                             @FormParam("locality") String city,
                             @DefaultValue("USER") @FormParam("role") String role) {

        // create a new user
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

        // Create address
        Address address = new Address(street, streetNumber, postalCode, city);
        ArrayList<Address> addressCollection = new ArrayList<>();
        addressCollection.add(address);
        user.setAddressCollection(addressCollection);

        // Register the new user with the persistence context and database
        userFacade.create(user);

    }

    @POST
    @Path("/update/{userId}")
    @Consumes("application/x-www-form-urlencoded")
    public void updateUserById(@FormParam("firstname") String firstname,
                               @FormParam("insertion") String insertion,
                               @FormParam("lastname") String lastname,
                               @FormParam("phone") String phone,
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

//        if (!addressCollection.contains(address)) {
//            addressCollection.add(address);
//            user.setAddressCollection(addressCollection);
//        }

        // Update user with persistence context and database
        userFacade.edit(updateUser);
    }

}

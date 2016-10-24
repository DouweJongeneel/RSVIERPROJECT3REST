package rest.resources;

import beans.entity.Address;
import beans.entity.User;
import beans.session.AddressFacade;
import beans.session.UserFacade;

import javax.json.JsonObject;
import javax.ws.rs.*;
import javax.ejb.EJB;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.*;


/**
 * Created by douwejongeneel on 30/09/2016.
 */

@Path("/users")
@Produces(MediaType.APPLICATION_JSON) // <-- default van alle methodes voor deze klasse
public class UserResource {

    @EJB
    private UserFacade userFacade;

    @EJB
    private AddressFacade addressFacade;

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
    @Path("/register/company")
    @Consumes({MediaType.APPLICATION_JSON})
    public void registerCompany(User company) {

        company.setRole("COMPANY");

        company = userFacade.create(company);

        // Check address, putt address in user and vice versa
        putAddressInUserAndUserInAddressAndCheckIfAddressExistsIfNotCreateNewAddress(company);

        // Create Company
        userFacade.edit(company);
    }

    @POST
    @Path("/register")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public void registerUser(@FormParam("firstname") String firstname,
                             @FormParam("insertion") String insertion,
                             @FormParam("lastname") String lastname,
                             @FormParam("phone") String phone,
                             @FormParam("email") String email,
                             @FormParam("username") String username,
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
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);

        user = userFacade.create(user);

        // Create address
        List<Address> addressList = addressFacade.withNamedQuery("Address.findByNumberAndZipcode", new String[] {"number", "zipcode"}, new String[] {streetNumber, postalCode });
        Address address = null;

       // If the address does not excist, create new and persist
        if (addressList.isEmpty()) {
            address = new Address(street, streetNumber, postalCode, city);
            address = addressFacade.create(address);
            ArrayList<Address> tempAddressList = new ArrayList<>();
            tempAddressList.add(address);
            user.setAddressCollection(tempAddressList);
        }
        else { // add user to the address that already exists
            address = addressList.get(0);
            ArrayList<Address> tempAddressList = new ArrayList<>();
            tempAddressList.add(address);
            user.setAddressCollection(tempAddressList);
        }

        // Register the new user with the database and put the return object including user_id in address
       userFacade.edit(user);

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

    public void putAddressInUserAndUserInAddressAndCheckIfAddressExistsIfNotCreateNewAddress(User user) {
        // Create address
        List<Address> addressList = addressFacade.withNamedQuery("Address.findByNumberAndZipcode", new String[]{"number", "zipcode"}, new String[]{user.getStreet_number(), user.getPostal_code()});
        Address tempAddress = new Address();
        // If the address does not excist, create new and persist
        if (addressList.isEmpty()) {
            tempAddress = new Address(user.getRoute(), user.getStreet_number(), user.getPostal_code(), user.getLocality());
            HashSet<User> addressUserColection = new HashSet<>();
            addressUserColection.add(user);
            tempAddress.setUserCollection(addressUserColection);
            tempAddress = addressFacade.create(tempAddress);

        } else { // add User to the address that already exists
            tempAddress = addressList.get(0);
            HashSet<User> tempAddressUserCollection = new HashSet<>(tempAddress.getUserCollection());
            tempAddressUserCollection.add(user);
            tempAddress.setUserCollection(tempAddressUserCollection);
        }

        HashSet<Address> tempAddresCollection = new HashSet<>();
        tempAddresCollection.add(tempAddress);
        user.setAddressCollection(tempAddresCollection);
    }

}

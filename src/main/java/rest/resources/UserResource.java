package rest.resources;

import beans.entity.User;
import beans.session.UserFacade;

import javax.ws.rs.Path;
import javax.ejb.EJB;
import java.util.List;

/**
 * Created by douwejongeneel on 30/09/2016.
 */

@Path("/users")
public class UserResource {

    @EJB
    private UserFacade userFacade;


    public List<User> getUsers(){
        return userFacade.findAll();
    }
}

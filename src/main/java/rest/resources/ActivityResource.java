package rest.resources;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import beans.entity.Activity;
import beans.entity.User;
import beans.session.ActivityFacade;
import beans.session.UserFacade;

@Path("/activity")
public class ActivityResource {

	@EJB
	private ActivityFacade activityFacade;

	@EJB
	private UserFacade userFacade;

	@GET
	@Path("/getAll")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Activity> getAllAcitivities(){
		return activityFacade.findAll();
	}

	@GET
	@Path("/search/{namedQuery}/{variableName}/{value}")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Activity> findBy(@PathParam(value = "namedQuery") String namedQuery, 
			@PathParam(value = "variableName")String variableName, @PathParam(value = "value") String value){
		return activityFacade.withNamedQuery(namedQuery, variableName, value);
	}

	@GET
	@Path("/search/price/{price}")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Activity> findBy(@PathParam(value = "price") BigDecimal price){
		return activityFacade.withNamedQuery("Activity.findByPrice", "price", price);
	}

	@POST
	@Path("/postActivity")
	@Consumes(MediaType.APPLICATION_JSON)
	public void postActivity(Activity activity){
		activityFacade.create(activity);
	}

	@PUT
	@Path("/edit")
	@Consumes(MediaType.APPLICATION_JSON)
	public void editActivity(Activity activity){
		activityFacade.edit(activity);
	}


	// Takes userId to check if a valid party (the organiser or an admin) is removing the activity
	@DELETE
	@Path("/delete/{userId}")
	@Consumes(MediaType.APPLICATION_JSON)
	public void deleteActivity(@PathParam(value = "userId") long userId, Activity activity){
		if(activity.getOrganiser().getId() == userId || ((User)userFacade.find(userId)).getRole().equals("admin"))
			activityFacade.remove(activity);
	}

}

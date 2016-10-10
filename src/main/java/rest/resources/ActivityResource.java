package rest.resources;

import java.util.List;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import beans.entity.Activity;
import beans.session.ActivityFacade;

@Path("/activities")
public class ActivityResource {

	@EJB
	private ActivityFacade activityFacade;
	
	@GET
	@Path("/getAll")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Activity> getAllAcitivities(){
		return activityFacade.findAll();
	}
	
	@POST
	@Path("/postActivity")
	@Consumes(MediaType.APPLICATION_JSON)
	public void postActivity(Activity activity){
		activityFacade.create(activity);
	}
}

package rest.resources;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import beans.entity.Activity;
import beans.entity.Address;
import beans.entity.Category;
import beans.entity.User;
import beans.session.ActivityFacade;
import beans.session.AddressFacade;
import beans.session.CategoryFacade;
import beans.session.UserFacade;
import helpers.RESTDateParam;

@Path("/activities")
public class ActivityResource {

	@EJB
	private ActivityFacade activityFacade;

	@EJB
	private AddressFacade addressFacade;

	@EJB
	private UserFacade userFacade;

	@EJB
	private CategoryFacade categoryFacade;
	
	@GET
	@Produces({MediaType.APPLICATION_JSON})
	public List<Activity> getAllAcitivities(){
		return activityFacade.findAll();
	}

	@GET
	@Path("/{id}")
	@Produces({MediaType.APPLICATION_JSON})
	public Activity getActivityPageById(@PathParam("id") Long id) {
		return activityFacade.find(id);
	}
	
	@POST
	@Path("/register")
	@Consumes({MediaType.APPLICATION_JSON})
	public void registerActivity(Activity activity, @Context HttpServletRequest request){

		// Get the user from the session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// Create address
		List<Address> addressList = addressFacade.withNamedQuery("Address.findByNumberAndZipcode", new String[] {"number", "zipcode"}, new String[] {activity.getStreet_number(), activity.getPostal_code()});

		ArrayList<Activity> activityList = new ArrayList<>();
		activityList.add(activity);

		// If the address does not excist, create new and persist
		if (addressList.isEmpty()) {
			Address address = new Address(activity.getRoute(), activity.getStreet_number(), activity.getPostal_code() , activity.getLocality());
			activity.setAddress(addressFacade.create(address));
//			address.setActivityCollection(activityList);
		}
		else { // add activity to the address that already exists
			Address tempAddress = addressList.get(0);
			ArrayList<Activity> tempAddressActivityCollection = new ArrayList<>(tempAddress.getActivityCollection());
			tempAddressActivityCollection.add(activity);
			tempAddress.setActivityCollection(tempAddressActivityCollection);
			activity.setAddress(tempAddress);
		}

		// Create Category
		Category tempCategory = new Category("Dance"); // <-- TODO category

		// Create activity
		activity.setOrganiser(user);

		// Register Category
		categoryFacade.create(tempCategory);

		// Register the new activity
		activity = activityFacade.create(activity);
//		activityFacade.edit(activity);
	}
}

package rest.resources;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
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

		// Add organiser to activity
		activity.setOrganiser(getUserFromSession(request));

		// add address
		putAddressInActivityAndActivityInAddressAndCheckIfAddressExistsIfNotCreateNewAddress(activity);

		// Create Category
		Category tempCategory = new Category("Dance"); // <-- TODO category

		// Register Category
		categoryFacade.create(tempCategory);

		// Register the new activity
		activityFacade.create(activity);
	}
	
	@PUT
	@Path("/modify")
	@Consumes({MediaType.APPLICATION_JSON})
	public void modifyActivity(Activity activity, @Context HttpServletRequest request) {

		activity.setOrganiser(getUserFromSession(request));

		putAddressInActivityAndActivityInAddressAndCheckIfAddressExistsIfNotCreateNewAddress(activity);

		System.out.println("Activity ID: " + activity.getId());

		// Register the new activity
		activityFacade.edit(activity);
	}
	
	public User getUserFromSession(HttpServletRequest request) {
		// Get the user from the session
		HttpSession session = request.getSession();
		return (User) session.getAttribute("user");
	}
	
	public void putAddressInActivityAndActivityInAddressAndCheckIfAddressExistsIfNotCreateNewAddress(Activity activity) {
		// Create address
		List<Address> addressList = addressFacade.withNamedQuery("Address.findByNumberAndZipcode", new String[]{"number", "zipcode"}, new String[]{activity.getStreet_number(), activity.getPostal_code()});
		
		// If the address does not excist, create new and persist
		if (addressList.isEmpty()) {
			Address address = new Address(activity.getRoute(), activity.getStreet_number(), activity.getPostal_code(), activity.getLocality());
			HashSet<Activity> addressActivityColection = new HashSet<>();
			addressActivityColection.add(activity);
			address.setActivityCollection(addressActivityColection);
			address = addressFacade.create(address);
			activity.setAddress(address);
			
		} else { // add activity to the address that already exists
			Address tempAddress = addressList.get(0);
			HashSet<Activity> tempAddressActivityCollection = new HashSet<>(tempAddress.getActivityCollection());
			tempAddressActivityCollection.add(activity);
			tempAddress.setActivityCollection(tempAddressActivityCollection);
			activity.setAddress(tempAddress);
		}
	}
}

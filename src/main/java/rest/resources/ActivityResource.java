package rest.resources;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ws.rs.*;
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
	@Path("/getAll")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Activity> getAllAcitivities(){
		return activityFacade.findAll();
	}
	
	@POST
	@Path("/register")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void registerActivity(@FormParam("name") String name,
								 @FormParam("route") String street,
								 @FormParam("street_number") String streetNumber,
								 @FormParam("postal_code") String postalCode,
								 @FormParam("locality") String city,
								 @FormParam("price") String price,
								 @FormParam("date_field") RESTDateParam startDate, // Custom date helper
								 @FormParam("description") String description,
								 @FormParam("category") String category,
								 @FormParam("website") String website,
								 @FormParam("enrollmentDeadline") String enrollmentDeadline,
								 @FormParam("enrollmentCapacity") String enrollmentCapacity
								 ){

		// User
		User user = new User("Douwe", "Jongeneel", "d@j.nl", "1234", "ADMIN"); // <-- Todo user uit sessie halen

		// Create address
		Address address = new Address(street, streetNumber, postalCode, city);

		// Create Category
		Category tempCategory = new Category("Dance"); // <-- TODO category

		// Create activity
		Activity activity = new Activity();
		activity.setOrganiser(user);
		activity.setName(name);
		activity.setAddress(address);
		activity.setPrice(new BigDecimal(price.replaceAll(",", "")));
		activity.setStartDate(startDate.getDate());

		// Register user
		userFacade.create(user);

		// Register Category
		categoryFacade.create(tempCategory);

		// Register the new activity
		activityFacade.create(activity);
	}
}

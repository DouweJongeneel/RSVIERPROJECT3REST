package rest.resources;

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

import beans.entity.Invoice;
import beans.entity.User;
import beans.session.InvoiceFacade;
import beans.session.UserFacade;

@Path("/invoice")
public class InvoiceResource {

	@EJB
	private InvoiceFacade invoiceFacade;

	@EJB
	private UserFacade userFacade;

	@GET
	@Path("/getAll")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Invoice> getAllInvoices(){
		return invoiceFacade.findAll();
	}

	@GET
	@Path("/search/{namedQuery}/{variableName}/{value}")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Invoice> findBy(@PathParam(value = "namedQuery") String namedQuery, 
			@PathParam(value = "variableName")String variableName, @PathParam(value = "value") String value){
		return invoiceFacade.withNamedQuery(namedQuery, variableName, value);
	}

	@POST
	@Path("/postInvoice")
	@Consumes(MediaType.APPLICATION_JSON)
	public void postInvoice(Invoice invoice){
		invoiceFacade.create(invoice);
	}

	@PUT
	@Path("/edit")
	@Consumes(MediaType.APPLICATION_JSON)
	public void editInvoice(Invoice invoice){
		invoiceFacade.edit(invoice);
	}

	// Takes userId to check if a valid party (an admin) is removing the invoice
	@DELETE
	@Path("/delete/{userId}")
	@Consumes(MediaType.APPLICATION_JSON)
	public void deleteInvoice(@PathParam(value = "userId") long userId, Invoice invoice){
		if(((User)userFacade.find(userId)).getRole().equals("admin"))
			invoiceFacade.remove(invoice);
	}

}

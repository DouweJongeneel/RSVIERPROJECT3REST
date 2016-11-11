package helpers;

/**
 * Created by douwejongeneel on 11/10/2016.
 */
import javax.ws.rs.WebApplicationException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class RESTDateParam {

    // Declare data format for parsing to be correct
    private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    private java.util.Date date;

    /**
     * Default constructor that takes a single string parameter and converts it to a
     * java.util.Date object
      * @param dateString
     * @throws WebApplicationException
     */
    public RESTDateParam( String dateString) throws WebApplicationException {
        try {
            date = new java.util.Date(dateFormat.parse(dateString).getTime());
        } catch (final ParseException ex) {
            // Wrap up any exception as javax.ws.rs.WebApplicationException
            throw new WebApplicationException(ex);
        }
    }

    /**
     * Getter that returns the pared data string value as java.sql.Date
     */
    public java.util.Date getDate() {
        return date;
    }

    @Override
    public String toString() {
        if (date != null) {
            return date.toString();
        }
        else {
            return "";
        }
    }

}

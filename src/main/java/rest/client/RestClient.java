package rest.client;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * Created by douwejongeneel on 30/09/2016.
 */
public class RestClient {

    Client client = Client.create();
    String getUrl = "http://localhost:8080/workshop3.rest/resources/users/1";
    String postUrl = "http://localhost:8080/workshop3.rest/resources/users/register/2";

    public void getRequest(){
        WebResource webResource = client.resource(getUrl);
        ClientResponse response = webResource.accept("application/json").get(ClientResponse.class);
        if(response.getStatus()!=200){
            throw new RuntimeException("HTTP Error: "+ response.getStatus());
        }

        String result = response.getEntity(String.class);
        System.out.println("Response from the Server: ");
        System.out.println(result);
    }

    public void postRequest(){
        WebResource webResource = client.resource(postUrl);
        String inputData = "{\"firstName\":\"Alice\",\"lastName\":\"Brown\",\"school\":\"Bright Stars\",\"standard\":\"Three\",\"rollNumber\":1212}";
        ClientResponse response = webResource.type("application/json").post(ClientResponse.class,inputData);
        if(response.getStatus()!=201){
            throw new RuntimeException("HTTP Error: "+ response.getStatus());
        }

        String result = response.getEntity(String.class);
        System.out.println("Response from the Server: ");
        System.out.println(result);
    }

    public static void main(String[] args) {
        RestClient restClient = new RestClient();
        //fire the get request on the server
        restClient.getRequest();
        //method to fire the post request on the server
        restClient.postRequest();
    }
}

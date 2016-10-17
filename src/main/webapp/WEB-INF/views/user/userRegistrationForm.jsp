<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 03/10/2016
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--Header en footer moeten eerst verklaard worden anders HTTP 500 error--%>
<%--Let op: er kunnen geen comments in de t:genericpage geschreven worden!--%>

<t:genericpage>

    <jsp:attribute name="header">

    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>

    <jsp:body>
        <h3>Register User:</h3>

        <div>

        </div>
        <div>
            <form class="form-horizontal" method="post" action="http://localhost:8080/workshop3.rest/resources/users/register">
                <div class="form-group">

                    <label class="control-label col-sm-2" for="firstname">Voornaam: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="firstname" name="firstname"/><br/>
                    </div>

                    <label class="control-label col-sm-2" for="insertion">Tussenvoegsel: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="insertion" name="insertion"/><br/>
                    </div>

                    <label class="control-label col-sm-2" for="lastname">Achternaam: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="lastname" name="lastname"/><br/>
                    </div>

                    <label class="control-label col-sm-2" for="phone">telefoon: </label>
                    <div class="col-sm-10">
                        <input type="tel" class="form-control" id="phone" name="phone"/><br/>
                    </div>

                    <label class="control-label col-sm-2" for="email">email: </label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="email" name="email"/><br/>
                    </div>

                    <label class="control-label col-sm-2" for="password">wachtwoord: </label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" name="password"/><br/>
                    </div>

                    <label class="control-label col-sm-2" for="geocomplete">Adres: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="geocomplete"  placeholder="Voer je adres in"><br/>
                    </div>

                    <div class="col-sm-2"></div>
                        <label class="control-label col-sm-1" for="straat">Straat:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="straat" name="route" value="">
                        </div>

                        <label class="control-label col-sm-1" for="huisnr">Huisnr: </label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="huisnr" name="street_number" value=""><br/>
                        </div>

                    <div class="col-sm-2"></div>
                        <label class="control-label col-sm-1" for="postcode">Postcode: </label>
                        <div class="col-sm-1">
                            <input type="text" class="form-control" id="postcode" name="postal_code" value="">
                        </div>

                        <label class="control-label col-sm-1" for="woonplaats">Woonplaats: </label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="woonplaats" name="locality" value="">
                        </div>

                        <label class="control-label col-sm-1" for="land">Land: </label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="land" name="country" value=""><br/>
                        </div>


                    <button id="userRegisterButton">Register</button>
                </div>
            </form>

        </div>

        <script> // Script voor geocomplete google maps address autocomplete
        $(function(){

            $("#geocomplete").geocomplete({
                details: ".form-group",
            });


            $("#findAddress").click(function(){
                $("#geocomplete").trigger("geocode");
            });

        });
        </script>
    </jsp:body>
</t:genericpage>

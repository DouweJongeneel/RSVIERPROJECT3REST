<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 07/10/2016
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <div id="activityRegistrationDiv">

            <h1> Register Activity </h1>
            <br/>
            <form method="post" action="http://localhost:8080/workshop3.rest/resources/activities/register">

                <label>Name: </label>
                <input type="text" name="name">
                <br/>
                <label>Date: </label>
                <input type="text" name="date_field">
                <br/>
                <label>Price: </label>
                <input type="text" name="price">
                <br/>

                <%--<label>Description: </label>--%>
                <%--<input type="text" name="description" maxlength="255">--%>
                <%--<br/>--%>
                <%--<label>Category: </label>--%>
                <%--<input type="text" name="category" maxlength="255">--%>
                <%--<br/>--%>
                <%--<label>Website: </label>--%>
                <%--<input type="text" name="website" maxlength="255">--%>
                <%--<br/>--%>
                <%--<label>Enrollment Deadline: </label>--%>
                <%--<input name="text" name="enrollmentDeadline">--%>
                <%--<br/>--%>
                <%--<label>Enrollment Capacity: </label>--%>
                <%--<input type="text" name="enrollmentCapacity" >--%>

                Address: <input id="geocomplete" type="text" placeholder="Voer een adres in" />
                <button class="findAddress">find</button>

                <fieldset class="addressDetails">
                    <h3> Adres Gegevens </h3>

                    <label>Straat</label>
                    <input name="route" type="text" value="">

                    <label>Huisnummer</label>
                    <input name="street_number" type="text" value="">

                    <label>Postcode</label>
                    <input name="postal_code" type="text" value="">

                    <label>Plaats</label>
                    <input name="locality" type="text" value="">

                    <label>Land</label>
                    <input name="country" type="text" value="">
                </fieldset>
                <br/>
                <button id="activityRegisterButton">Create Activity</button>

            </form>

            <div class="map_canvas"></div>

        </div>

        <script> // Script voor geocomplete google maps address autocomplete
            $(function(){

                $("#geocomplete").geocomplete({
                    details: ".addressDetails",
                });


                $("#findAddress").click(function(){
                    $("#geocomplete").trigger("geocode");
                });

            });
        </script>

    </jsp:body>
</t:genericpage>
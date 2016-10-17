<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 06/10/2016
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <form>
            <input onload="geocompleteFunction()" id="geocomplete" type="text" placeholder="Type in an address" />
            <input id="find" type="button" value="find" />
        </form>

        <div class="googleMap"> Google Map Hier!</div>

        <script>
            geocompleteFunction();
        </script>




        <script>
            $(function(){

                $("#geocomplete").geocomplete({
                    map: ".googleMap",
                    mapOptions: {
                        zoom: 10
                    },
                    location: "Groningen",
                    details: ".addressForm"
                });


                $("#find").click(function(){
                    $("#geocomplete").trigger("geocode");
                });

            });
        </script>


    </jsp:body>
</t:genericpage>

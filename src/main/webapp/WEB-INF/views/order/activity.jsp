<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 25/10/2016
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title text-center">Bestelling</h3>
            </div>
            <div class="panel-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Activiteit</th>
                            <th>Naam</th>
                            <th>Datum</th>
                            <th>Tijd</th>
                            <th>Prijs</th>
                            <th>Kaartjes</th>
                        </tr>
                    </thead>
                    <tbody id="orderTableBody">

                    </tbody>
                </table>

            </div>
        </div>

        <script>
            $(document).ready(function() {
                initOrderTable(${requestScope.get('id')})
            })

        </script>


    </jsp:body>
</t:genericpage>
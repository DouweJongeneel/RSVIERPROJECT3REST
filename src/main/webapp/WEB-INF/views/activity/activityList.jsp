<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 24/10/2016
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <table id="activityTable" class="display" width="100%" celspacing="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Naam</th>
                    <th>Beschrijving</th>
                    <th>Begint</th>
                    <th>Eindigt</th>
                    <th>Tijd</th>
                    <th>prijs &euro;</th>
                    <th>Kaarten</th>
                    <th>Adres</th>
                    <th>Organisator</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Naam</th>
                    <th>Beschrijving</th>
                    <th>Begint</th>
                    <th>Eindigt</th>
                    <th>Tijd</th>
                    <th>prijs &euro;</th>
                    <th>Kaarten</th>
                    <th>Adres</th>
                    <th>Organisator</th>
                </tr>
            </tfoot>
        </table>

    </jsp:body>
</t:genericpage>
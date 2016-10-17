<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 04/10/2016
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>

    <jsp:attribute name="header">

    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>

    <jsp:body>

        <script>$(initUserListTable);</script>

        <table id="userTable" class="display" width="100%" cellspacing="0">
            <thead>
                <tr>
                    <th>voornaam</th>
                    <th>tussenvoegsel</th>
                    <th>achternaam</th>
                    <th>telefoon</th>
                    <th>email</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
                <tr>
                    <th>voornaam</th>
                    <th>tussenvoegsel</th>
                    <th>achternaam</th>
                    <th>telefoon</th>
                    <th>email</th>
                </tr>
            </tfoot>
        </table>

    </jsp:body>
</t:genericpage>
<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 07/10/2016
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col-sm-4">.col-sm-4

                <table id="activityTableShort">
                    <thead>
                        <tr>
                            <th>Activiteit</th>
                            <th>Datum</th>
                            <th>Plaats</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>


            </div>
            <div class="col-sm-8">.col-sm-8

            </div>
        </div>
    </jsp:body>
</t:genericpage>
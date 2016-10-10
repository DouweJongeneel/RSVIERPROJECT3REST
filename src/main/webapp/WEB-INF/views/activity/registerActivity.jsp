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
        <div id="registerActivity">
            <header>Register Activity</header>
            <br/>
            <ul>
                <li>
                    <label>Name: </label>
                    <input type="text" name="name">
                </li>
                <li>
                    <label>Place: </label>
                    <input type="text" name="place">
                </li>
            </ul>

        </div>
    </jsp:body>
</t:genericpage>
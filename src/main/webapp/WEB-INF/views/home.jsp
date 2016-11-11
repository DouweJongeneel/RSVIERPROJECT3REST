<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 06/10/2016
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <div class="jumbotron">
            <c:choose>
                <c:when test="${sessionScope.get('user') != null}">
                    <h1> ${sessionScope.get("user").username}, <small>yesterday my life was filled with rain</small></h1>
                    <p>  ${sessionScope.get("user").firstname}, you smiled at me and really eased the pain<br>The dark days are gone, and the bright days are here! </p>
                </c:when>
                <c:otherwise>
                    <h1> Welcome to the jungle <small>we got fun and games</small></h1>
                    <p>We got everything you want honey, we know the names <br>We are the people that can find whatever you may need <br> If you got the money honey we got your disease</p>
                </c:otherwise>
            </c:choose>
        </div>
        <c:choose>
            <c:when test="${sessionScope.get('user') != null}">
                <h2>Welkom bij de Eventile jungle</h2>
            </c:when>
            <c:otherwise>
                <h2>Eventile gewoon eventilicious</h2>
            </c:otherwise>
        </c:choose>


    </jsp:body>
</t:genericpage>

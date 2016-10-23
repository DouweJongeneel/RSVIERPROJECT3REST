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

       <h3>Hello ${sessionScope.get("user")}, welcome to ...</h3>

        <div>
        <dl class="dl-horizontal">
            <c:choose>
               <c:when test="${false}">
                   <dt>Company</dt><dd>Houthakkers inc.</dd>
               </c:when>
               <c:otherwise>
                   <dt>Username</dt><dd>Douwe</dd>
               </c:otherwise>
            </c:choose>
        </dl>
        </div>

    </jsp:body>
</t:genericpage>

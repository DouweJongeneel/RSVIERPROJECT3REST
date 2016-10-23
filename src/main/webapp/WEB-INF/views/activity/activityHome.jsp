<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 07/10/2016
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">Agenda</h2>
            </div>
            <div class="panel-body">
               <div class="row agendaBody">

               </div>
            </div>
        </div>

        <script>
        $(document).ready(function() {
            findAllActivities();
        });
        </script>

    </jsp:body>
</t:genericpage>
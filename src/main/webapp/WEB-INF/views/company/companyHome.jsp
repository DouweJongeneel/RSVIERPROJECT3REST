<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 26/10/2016
  Time: 00:27
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
                <h2 class="panel-title">Companies</h2>
            </div>
            <div class="panel-body">
                <div class="row companiesBody">

                </div>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                findAllCompanies();
            });
        </script>
    </jsp:body>
</t:genericpage>
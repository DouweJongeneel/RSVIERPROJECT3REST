<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 03/10/2016
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ tag description="Overall Page Template" pageEncoding="UTF-8" %>
<%@ attribute name="header" fragment="true" %>
<%@ attribute name="footer" fragment="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Opdracht 3</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/myJqueryFunctions.js"></script>

        <!-- DataTables-->
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>
        <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

        <!-- Superfish menu -->
        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/css/superfish.css"/>
        <script src="${pageContext.request.contextPath}/js/superfish/superfish.js"></script>
        <script src="${pageContext.request.contextPath}/js/superfish/hoverIntent.js"></script>
        <script src="${pageContext.request.contextPath}/js/superfish/supersubs.js"></script>
    </head>

    <body>
        <div id="pageheader" align="center">
            <jsp:invoke fragment="header"/>
            <!-- Superfish menu items -->

            <ul class="sf-menu">
                <li><a href="${pageContext.request.contextPath}/activities">Activities</a></li>
                <li><a href="#">Locations</a></li>
                    <ul>
                        <li><a href="#">page 2.1</a></li>
                        <li><a href="#">page 2.2</a></li>
                    </ul>
                <li><a href="#">Companies</a></li>
                <li>
                    <a href="#">Register</a>

                            <ul>
                                <li><a href="${pageContext.request.contextPath}/register/user">As User</a></li>
                                <li><a href="${pageContext.request.contextPath}/register/company">As Company</a></li>
                            </ul>
                </li>
                <li><a href="#">Login</a></li>
            </ul>
        </div>
        <div id="body">
            <jsp:doBody/>
        </div>
        <div id="pagefooter">
            <jsp:invoke fragment="footer"/>
            <p>Copyright 2016, AD Development</p>
        </div>
    </body>
</html>

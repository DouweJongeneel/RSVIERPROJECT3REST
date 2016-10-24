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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> <%--Bootsrap maakt gebruik van HTML5--%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"> <%--Zodat bootstrap goed rendered--%>
        <title>Opdracht 3</title>


        <!-- jQuery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

        <!-- DataTables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/jq-2.2.3/dt-1.10.12/r-2.1.0/datatables.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs/jq-2.2.3/dt-1.10.12/r-2.1.0/datatables.js"></script>


        <!-- Geocomplete -->
        <script src="//maps.googleapis.com/maps/api/js?key=AIzaSyB84u4zTerVZY0WpOBy9sHOyjeabakljhM&amp;libraries=places"></script>
        <script src="${pageContext.request.contextPath}/js/geocomplete/jquery.geocomplete.js"></script>

        <!-- BOOTSTRAP -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <!-- validator plugin -->
        <script src="//cdnjs.com/libraries/1000hz-bootstrap-validator"></script>
        <!-- /BOOTSTRAP -->

        <!-- CSS aanpassingen -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css">

    </head>

    <body>
        <div class="container-fluid"> <%--Zo zorgt bootstrap ervoor dat de breedte van de pagina afhankelijk is van het apparaat--%>
            <div id="pageheader" align="center">
                <jsp:invoke fragment="header"/>

                <%--BOOTSTRAP navigation bar--%>
                <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> WebSiteName</a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="${pageContext.request.contextPath}/home"><span class="glyphicon glyphicon-home"/> Home</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Evenementen
                                <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/activities">Agenda</a></li>
                                    <li><a href="${pageContext.request.contextPath}/activities/register">registreer</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Locaties</a></li>
                            <li><a href="#">Bedrijven</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <c:if test="${sessionScope.get('role') == 'ADMIN'}">
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                        <span class="glyphicon glyphicon-book"> Admin</span>
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="${pageContext.request.contextPath}/users/admin">Gebruikers</a></li>
                                        <li><a href="${pageContext.request.contextPath}/companies/admin">Bedrijven</a></li>
                                        <li><a href="${pageContext.request.contextPath}/activities/admin">Activiteiten</a></li>
                                        <li><a href="${pageContext.request.contextPath}/orders/admin">Bestellingen</a></li>
                                    </ul>
                                </li>
                            </c:if>

                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <span class="glyphicon glyphicon-user"></span>
                                        Schrijf in
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/register/user">Als Deelnemer</a></li>
                                    <li><a href="${pageContext.request.contextPath}/register/company">Als Bedrijf</a></li>
                                </ul>
                            </li>
                            <li>
                                <c:choose>
                                    <c:when test="${sessionScope.get('user') != null}">
                                        <a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span> Log uit </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Log in </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div id="body">
                <jsp:doBody/>
            </div>
            <div id="pagefooter">
                <jsp:invoke fragment="footer"/>
                <div class="col-sm-6 col-sm-offset-3">
                    <p class="text-center"><span class="glyphicon glyphicon-copyright-mark"></span>
                       Copyright 2016, AD Development</p>
                </div>
            </div>
        </div>
        <!-- Load my Javascript -->
        <script src="${pageContext.request.contextPath}/js/myJqueryFunctions.js"></script>
    </body>
</html>

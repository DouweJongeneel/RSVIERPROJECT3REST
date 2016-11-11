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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-social.css">

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
                        <a class="navbar-brand" href="#"> Eventile </a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath}/home"><span class="glyphicon glyphicon-home"/> Home</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Evenementen
                                <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/activities">Agenda</a></li>
                                    <li><a href="${pageContext.request.contextPath}/activities/register">registreer</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/companies">Bedrijven</a></li>
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
                                        <li><a href="#">Bedrijven</a></li>
                                        <li><a href="${pageContext.request.contextPath}/activities/admin">Activiteiten</a></li>
                                        <li><a href="#">Bestellingen</a></li>
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
        </div>
            <footer id="pageFooter">

                <jsp:invoke fragment="footer"/>

                <div id="footerContainer">
                    <div class="row">
                        <div class="col-sm-3 sitemap">
                            <h4>Sitemap</h4>
                            <ul class="list-unstyled">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Return Policy</a></li>
                                <li><a href="#">Terms and Condition</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>


                        <div class="col-sm-3 subscribe">
                            <h4>Enquiries</h4>
                            <p> evenementenlaan 15 <br />
                                1424 CD De Kwakkel <br />
                                The Netherlands</p>

                            <i class="fa fa-envelope"></i> ceo@eventile.nl<br />
                            <i class="fa fa-phone"></i> +31 0318-362547<br />
                        </div>
                        <div class="col-sm-3 joinus">
                            <h4>Subscribe</h4>
                            <div class="input-group col-sm-6 col-sm-offset-3"><input type="text" class="form-control" placeholder="Your Name" /></div>
                            <div class="input-group col-sm-6 col-sm-offset-3"><input type="text" class="form-control email" placeholder="Your Email Address..." /></div>
                            <div class="col-sm-12"><p> </p></div>
                            <button class="btn btn-primary"><i class="fa fa-paper-plane"></i> Subscribe</button>
                        </div>
                        <div class="col-sm-3">
                            <h4>Like and follow us</h4>

                            <div class="center-block"><a class="btn btn-social-icon btn-facebook"><span class="fa fa-facebook"></span></a></div>
                            <div class="center-block">
                                <a class="btn btn-social-icon btn-twitter"><span class="fa fa-twitter"></span></a>
                                <a class="btn btn-social-icon btn-youtube"><span class="fa fa-youtube"></span></a>
                                <a class="btn btn-social-icon btn-pinterest"><span class="fa fa-pinterest"></span></a>
                            </div>
                            <div class="center-block"><a class="btn btn-social-icon btn-instagram"><span class="fa fa-instagram"></span></a></div>
                        </div>
                        </div>


                        <div class="col-sm-6 col-sm-offset-3">
                            <br/>
                            <p class="text-center"><span class="glyphicon glyphicon-copyright-mark"></span>
                               Copyright 2016, AD Development</p>
                        </div>
                </div>
            </footer>
        <!-- Load my Javascript -->
        <script src="${pageContext.request.contextPath}/js/myJqueryFunctions.js"></script>
    </body>
</html>

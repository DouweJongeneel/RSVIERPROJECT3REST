<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 23/10/2016
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="jumbotron">
                    <c:choose>
                        <c:when test="${sessionScope.get('user') != null}">
                            <h1> Hey ${sessionScope.get("user").firstname}! <small>Add an image</small></h1>
                            <p>Breathe, breath in the air <br> dont be afraid to care <br> leave but don't leave me</p>
                        </c:when>
                        <c:otherwise>
                            <h1> Hey You! <small>ad an image?</small></h1>
                            <p>     out there in the cold <br> getting lonely getting old <br> can you feel me?</p>
                        </c:otherwise>
                    </c:choose>
                    <img src="#" alt="Event image here">
                </div>
            </div>
            <div class="panel-body">

                <div class="page-header">
                    <h1 id="activityName" align="center">Event Name<small id="organiserName">Organiser</small></h1>
                </div>

                <div>
                    <p class="text-justified" id="activityDescription"> Description Here </p>
                </div>

                <div id="dateAndTime">
                </div>

                <div class="col-sm-4 center-block">
                    <div class="input-group">
                        <span class="input-group-addon">Website:</span>
                        <input id="eventWebsite" type="text" class="form-control text-center" readonly>
                        <span class="input-group-btn"><a href="#" class="btn btn-default" role="button">Go!</a></span>
                    </div>
                </div>

                <div id="ticketInfo">
                    <h3 class="text-center">Ticket&nbsp;<small>Info</small></h3>

                    <div class="col-sm-6">
                        <div class="input-group col-sm-6 col-sm-offset-3">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-euro"></span></span>
                            <input id="ticketPrice" type="text" class="form-control text-center" readonly>
                            <span class="input-group-addon">per ticket</span>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <form class="form-inline">
                            <div class="form-group col-sm-8 col-sm-offset-2">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-duplicate"></span></span>
                                    <input type="text" class="form-control" id="ticketOrder" placeholder="Number of tickets">
                                </div>
                                <button type="button" class="btn btn-primary" id="ticketPurchaseButton">Order now</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12"><h2 id="Just to add a white line!"></h2></div>
                </div>



                <div class="panel panel-default col-sm-12">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Location</h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-sm-6">
                            <dl class="dl-horizontal" id="activityAddress">

                            </dl>
                        </div>
                        <div class="googleMap col-sm-6" id="geocomplete"></div>
                    </div>
                </div>

                <div class="panel panel-default col-sm-12">
                    <div class="panel panel-heading">
                        <h3 class="panel-title text-center">Organiser</h3>
                    </div>
                    <div class="panel-body">
                        <dl class="dl-horizontal col-sm-6" id="activityOrganiserDetails">

                        </dl>
                        <div class="jumbotron col-sm-6">
                            <img src="..." alt="Organiser Profile Picture">
                        </div>
                    </div>
                </div>

                <c:if test="${requestScope.get('user').username == requestScope.get('activity').organiser.username}">
                    <div class="col-sm-1 center-block">
                        <a href="${pageContext.request.contextPath}/activities/modify/${requestScope.get('id')}" type="button" class="btn btn-primary">Edit Activity</a>
                    </div>
                </c:if>


            </div>
        </div>

        <script>
            $(document).ready(function() {
                initialiseActivity(${requestScope.get("id")})
            })

            $(document).ready(function(){

                $("#geocomplete").geocomplete({
                map: ".googleMap",
                location: "Groningen Netherlands"
                });

            });
        </script>

    </jsp:body>
</t:genericpage>
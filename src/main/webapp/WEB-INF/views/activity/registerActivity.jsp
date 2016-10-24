<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 07/10/2016
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h1 class="panel-title"> Create Event</h1>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" id="activityRegisterForm" action="${pageContext.request.contextPath}/activities">
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
                        <p><a class="btn btn-primary btn-lg" href="#" role="button">Add Image</a></p>
                    </div>



                    <div class="form-group center-block form-group-lg">
                        <label class="control-label col-sm-2" for="name">Title: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="description">Description: </label>
                        <textarea class="form-control" rows="20" id="description" name="description" placeholder="Describe your event here"></textarea>
                    </div>

                    <div class="col-sm-8 center-block">
                        <label class="control-label col-sm-2" for="websiteInputField">Website:</label>
                        <div class="form-group col-sm-10" id="websiteInputField">
                            <div class="input-group">
                                <span class="input-group-addon" id="websiteAddon">www.</span>
                                <input type="text" class="form-control" id="website" name="website" aria-describedby="websiteAddon">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label class="control-label col-sm-1" for="dateInputField">Date: </label>
                        <div class="form-group col-sm-11" id="dateInputField">
                            <div class="input-group input-daterange">
                                <span class="input-group-addon"> From </span>
                                <input type="text" class="form-control" id="startDate" name="startDate">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                <span class="input-group-addon"> Till </span>
                                <input type="text" class="form-control" id="endDate" name="endDate">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label class="control-label col-sm-4" for="timePickerField">Starts at: </label>
                        <div class="form-group col-sm-8" id="timePickerField">
                            <div class="input-group clockpicker">
                                <input type="text" class="form-control" id="startTime" name="startTime">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                            </div>
                        </div>

                    </div>

                    <div class="col-sm-12">
                        <label class="control-label col-sm-3" for="price">Ticket Price: </label>
                        <div class="form-group col-sm-3">
                            <div class="input-group">
                                <input type="text" class="form-control" id="price" name="price">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-euro"></span></span>
                            </div>
                        </div>

                        <label class="control-label col-sm-3" for="ticketsAvailable">Tickets Available: </label>
                        <div class="form-group col-sm-3">
                            <div class="input-group">
                                <input type="text" class="form-control" id="ticketsAvailable" name="ticketsAvailable">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-duplicate"></span></span>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default col-sm-12">
                        <div class="panel-heading">
                            <h3 class="panel-title">Location</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-sm-8">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="geocomplete">Address: </label>
                                        <div class="input-group col-sm-10">
                                            <span class="input-group-btn"><button type="button" class="btn btn-default" id="findAddress">Find</button></span>
                                            <input type="text" class="form-control" id="geocomplete" placeholder="Voer adres in" />
                                        </div>
                                    </div>

                                </div>

                                <div class="panel panel-default col-sm-12">
                                    <div class="panel-heading">
                                        <h6 class="panel-title">Address details</h6>
                                    </div>
                                    <div class="addressDetails panel-body">

                                        <label class="control-label col-sm-1" for="route">Straat:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="route" name="route" value="">
                                        </div>

                                        <label class="control-label col-sm-1" for="street_number">Huisnr: </label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="street_number" name="street_number" value=""><br/>
                                        </div>

                                        <label class="control-label col-sm-2" for="postal_code">Postcode: </label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="postal_code" name="postal_code" value="">
                                        </div>

                                        <label class="control-label col-sm-1" for="locality">Plaats: </label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="locality" name="locality" value="">
                                        </div>

                                        <label class="control-label col-sm-1" for="country">Land: </label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="country" name="country" value=""><br/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="googleMap col-sm-4"></div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-2 center-block">
                <button class="btn btn-primary" id="registerActivityButton">Create Activity</button>
            </div>
        </div>

        <script> // Script voor geocomplete google maps address autocomplete
            $(document).ready(function() {
                $('.input-daterange input').each(function() {
                    $(this).datepicker({
                        format: 'dd/mm/yyyy'
                        });
                });
            })

            $(document).ready(function() {
                $('.clockpicker').clockpicker({
                    donetext: 'Done'});
            })



            $(function(){

                $("#geocomplete").geocomplete({
                    details: ".addressDetails",
                    map: ".googleMap",
                    location: "Groningen Netherlands"
                });


                $("#findAddress").click(function(){
                    $("#geocomplete").trigger("geocode");
                });

            });
        </script>
        <%--BOOTSTRAP DATEPICKER--%>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>

        <%--timepicker (clockpicker) for Bootstrap--%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clockpicker.css">
        <script src="${pageContext.request.contextPath}/js/clockpicker.js"></script>

    </jsp:body>
</t:genericpage>
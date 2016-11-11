<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 25/10/2016
  Time: 22:30
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
                <h3 class="panel-title">User Profile</h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" id="userRegistrationForm">
                    <div class="addressDetails form-group">

                        <div class="col-sm-8">

                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon">Voornaam: </span>
                                    <input type="text" class="form-control text-center" id="firstname" name="firstname" readonly/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon">tussenvoegsel</span>
                                    <input type="text" class="form-control text-center" id="insertion" name="insertion" readonly/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon">Achternaam: </span>
                                    <input type="text" class="form-control text-center" id="lastname" name="lastname" readonly/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Gebruikersnaam" readonly><br/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="wachtwoord" readonly/><br/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="phonenumber" readonly><br/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="email" readonly><br/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group col-sm-10 col-sm-offset-1">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-globe"></span></span>
                                    <input type="text" class="form-control" id="geocomplete" placeholder="Voer adres in" readonly/>
                                    <span class="input-group-btn"><button type="button" class="btn btn-default" id="findAddress">Find</button></span>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="jumbotron">
                                <img src="..." alt="">
                                <h3>Profile Picture</h3>
                                <div class="center-block">
                                    <a href="#" role="button" class="btn btn-primary">Add Picture</a>
                                </div>
                            </div>

                            <div class="col-sm-10 col-sm-offset-1">
                                <div class= "form-group">
                                    <textarea class="form-control" rows="7" id="description" name="description" placeholder="Introduceer jezelf" readonly></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default col-sm-12">
                            <div class="panel-heading">
                                <h3 class="panel-title text-center">Adres</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-sm-6">

                                    <div class="panel panel-default col-sm-12">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-center">Address Gegevens</h6>
                                        </div>
                                        <div class="addressDetails panel-body">

                                            <div class="col-sm-9">
                                                <input type="text" class="form-control text-center" id="route" name="route" placeholder="straat" readonly>
                                            </div>


                                            <div class="col-sm-3">
                                                <input type="text" class="form-control text-center" id="street_number" name="street_number" placeholder="huisnr" readonly><br/>
                                            </div>

                                            <div class="col-sm-3">
                                                <input type="text" class="form-control text-center" id="postal_code" name="postal_code" placeholder="postcode" readonly>
                                            </div>

                                            <div class="col-sm-6">
                                                <input type="text" class="form-control text-center" id="locality" name="locality" placeholder="woonplaats" readonly>
                                            </div>

                                            <div class="col-sm-3">
                                                <input type="text" class="form-control text-center" id="country" name="country" placeholder="land" readonly><br/>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="googleMap col-sm-6"></div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                initUserPage(${requestScope.get("id")});
            })
        </script>
    </jsp:body>
</t:genericpage>
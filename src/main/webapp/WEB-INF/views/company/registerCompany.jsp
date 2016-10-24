<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 24/10/2016
  Time: 16:14
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
                <h1 class="panel-title">Register Company</h1>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" id="companyRegisterForm">

                    <div class="jumbotron">
                        <img src="..." alt="Company Image">
                    </div>

                    <div class="col-sm-6 center-block">
                        <div class="form-group form-group-lg">
                            <div class="input-group">
                                <span class="input-group-addon">Company Name: </span>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Description: </label>
                        <textarea class="form-control" rows="20" id="description" name="description" placeholder="Describe your event here"></textarea>
                    </div>

                    <div class="col-sm-10 center-block">
                        <div class="form-group col-sm-10" id="websiteInputField">
                            <div class="input-group">
                                <span class="input-group-addon" id="websiteAddon">Website: </span>
                                <input type="text" class="form-control" id="website" name="website" aria-describedby="websiteAddon">
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default col-sm-12">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Account Gegevens</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="input-group col-sm-8 col-sm-offset-2">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Gebruikersnaam" ><br/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group col-sm-8 col-sm-offset-2">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="wachtwoord"/><br/>
                                </div>
                            </div>
                            <div class="panel panel-default col-sm-6">
                                <div class="panel-heading">
                                    <h3 class="panel-title text-center">Contact Persoon</h3>
                                </div>
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="input-group col-sm-10 col-sm-offset-1">
                                            <span class="input-group-addon">Voornaam: </span>
                                            <input type="text" class="form-control text-center" id="firstname" name="firstname"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group col-sm-10 col-sm-offset-1">
                                            <span class="input-group-addon">tussenvoegsel</span>
                                            <input type="text" class="form-control text-center" id="insertion" name="insertion"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group col-sm-10 col-sm-offset-1">
                                            <span class="input-group-addon">Achternaam: </span>
                                            <input type="text" class="form-control text-center" id="lastname" name="lastname"/>
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <div class="panel panel-default col-sm-6">
                                <div class="panel-heading">
                                    <h3 class="panel-title text-center">Contact Gegevens</h3>
                                </div>
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="input-group col-sm-10 col-sm-offset-1">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="phonenumber"><br/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group col-sm-10 col-sm-offset-1">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                            <input type="email" class="form-control" id="email" name="email" placeholder="email"><br/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group col-sm-10 col-sm-offset-1">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-globe"></span></span>
                                            <input type="text" class="form-control" id="geocomplete" placeholder="Voer adres in" />
                                            <span class="input-group-btn"><button type="button" class="btn btn-default" id="findAddress">Find</button></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default col-sm-12">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Locatie</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-sm-6">

                                <div class="panel panel-default col-sm-12">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-center">Controleer Address Gegevens</h6>
                                    </div>
                                    <div class="addressDetails panel-body">

                                        <div class="col-sm-9">
                                            <input type="text" class="form-control text-center" id="route" name="route" placeholder="straat">
                                        </div>


                                        <div class="col-sm-3">
                                            <input type="text" class="form-control text-center" id="street_number" name="street_number" placeholder="huisnr"><br/>
                                        </div>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control text-center" id="postal_code" name="postal_code" placeholder="postcode">
                                        </div>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control text-center" id="locality" name="locality" placeholder="woonplaats">
                                        </div>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control text-center" id="country" name="country" placeholder="land"><br/>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="googleMap col-sm-6"></div>
                        </div>
                    </div>
                </form>
                <div class="col-sm-2 center-block">
                    <a href="#" role="button" class="btn btn-primary" id="companyRegistrationButton">Register Company</a>
                </div>
            </div>
        </div>


    </jsp:body>
</t:genericpage>
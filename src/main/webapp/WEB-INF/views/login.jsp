<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 14/10/2016
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>

    <jsp:attribute name="header"></jsp:attribute>
    <jsp:attribute name="footer"></jsp:attribute>

    <jsp:body>
        <form data-toggle="validator" role="form">
            <div class="form-group has-feedback col-sm-6 col-sm-offset-3">
                <label class="control-label" for="username">Gebruikersnaam </label>
                <div class="input-group">
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-user"></span> </span>
                    <input type="text" pattern="^[_A-z0-9]{1,}$" maxlength="255" class="form-control" id="username"
                           placeholder="gebruikersnaam" required>
                </div>
                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                <div class="help-block with-errors">Hey look an icon!</div>
            </div>
            <div class="form-group col-sm-6 col-sm-offset-3">
                <label for="inputPassword" class="control-label">Wachtwoord </label>
                <div class="input-form">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="password" data-minLength="4" class="form-control" id="inputPassword" placeholder="wachtwoord" required>
                    </div>
                    <div class="help-block">Minimaal 4 characters</div>
                </div>
            </div>
            <div class="form-group col-sm-2 col-sm-offset-5">
                <button type="submit" class="btn btn-default">Login</button>
            </div>
        </form>
    </jsp:body>
</t:genericpage>
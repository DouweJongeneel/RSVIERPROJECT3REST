<%--
  Created by IntelliJ IDEA.
  User: douwejongeneel
  Date: 03/10/2016
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--Header en footer moeten eerst verklaard worden anders HTTP 500 error--%>
<%--Let op: er kunnen geen comments in de t:genericpage geschreven worden!--%>

<t:genericpage>

    <jsp:attribute name="header">
      <h1>Welcome</h1>
    </jsp:attribute>
    <jsp:attribute name="footer">
      <p id="copyright">Copyright 1927, Future Bits When There Be Bits Inc.</p>
    </jsp:attribute>

    <jsp:body>
        <h1>Register User:</h1>
        <div>
            <form method="post" action="http://localhost:8080/workshop3.rest/resources/users/register">

                <label>Voornaam: </label>
                <input type="text" name="firstname"/>
                <br/>
                <label>Tussenvoegsel: </label>
                <input type="text" name="insertion"/>
                <br/>
                <label>Achternaam: </label>
                <input type="text" name="lastname"/>
                <br/>
                <label>telefoon: </label>
                <input type="text" name="phone"/>
                <br/>
                <label>email: </label>
                <input type="text" name="email"/>
                <br/>
                <label>wachtwoord: </label>
                <input type="text" name="password"/>
                <input type="submit" value="Submit"/>
            </form>

        </div>
    </jsp:body>
</t:genericpage>

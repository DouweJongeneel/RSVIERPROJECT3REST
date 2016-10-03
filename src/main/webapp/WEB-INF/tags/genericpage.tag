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
    <body>
        <div id="pageheader">
            <jsp:invoke fragment="header"/>
        </div>
        <div id="body">
            <jsp:doBody/>
        </div>
        <div id="pagefooter">
            <jsp:invoke fragment="footer"/>
        </div>
    </body>
</html>

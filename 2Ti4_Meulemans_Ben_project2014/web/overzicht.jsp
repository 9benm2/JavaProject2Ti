<%-- 
    Document   : boeken
    Created on : May 20, 2014, 10:31:17 AM
    Author     : BTO-Ben
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="info.toegepaste.www.entity.Boek"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Overzicht artikels</h1>
        <ul>
            <c:forEach var="boek" items="${requestScope.boeken}">
                <li><c:out value="${boek.titel}"></c:out></li>
                </c:forEach>
        </ul>
    </body>
</html>

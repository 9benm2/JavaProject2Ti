<%-- 
    Document   : boeken
    Created on : May 20, 2014, 10:31:17 AM
    Author     : BTO-Ben
--%>



<%@page import="info.toegepaste.www.entity.Genre"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
           prefix="fn" %> 
<%@page import="java.util.List"%>
<%@page import="info.toegepaste.www.entity.Boek"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic Page Needs -->
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Mediatheek - Overzicht artikels</title>

        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS -->
        <link rel="stylesheet" href="css/normalize.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui-1.10.4.min.css" type="text/css">


        <!-- Scripts -->
        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.4.min.js"></script>
        <script>
            $(function() {
                $("input[type=submit], button").button();
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overzicht artikels</title>
    </head>
    <body>
        <header class="clearfix centertext">
            <div class="container">
                <a href="index.jsp"><h1>Mediatheek - Overzicht artikels</h1></a>
            </div>
        </header>
        <section>
            <div class="container">
                <form method="GET" action="ManageServlet">
                    <div class="row clearfix">
                        <div class="column third littlepadding">
                            <label class="overzichtlabel" for="zoeken">Zoeken:</label>
                            <input class="overzichtinput" id="zoeken" type ="text" name="titel" value="">
                        </div>
                        <div class="column third littlepadding">
                            <label class="overzichtlabel" for="genre">Genre:</label>
                            <select class="overzichtinput" name="genre" id="genre">
                                <option>Alle</option>
                                <%for (Genre genre : Genre.values()) {%>
                                <option class="lowercase"><%=genre%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="column third rightalign littlepadding">
                            <label class="overzichtlabel" for="jaar">Jaar:</label>
                            <input class="overzichtinput" type="text" name="jaar" id="jaar" value="">
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="column half littlepadding">
                            <label class="overzichtlabelhalf" for="auteur">Auteur:</label>
                            <input class="overzichtinputhalf" type="text" name="auteur" id="auteur" value="">
                        </div>
                        <div class="column half rightalign littlepadding">
                            <label class="overzichtlabelhalf" for="regisseur">Regisseur:</label>
                            <input class="overzichtinputhalf" type="text" name="regisseur" id="regisseur" value="">                            
                        </div>
                    </div>
                    <div class="row clearfix littlepadding">
                        <input class="center" type="submit" name="filteren" value="Filteren">
                    </div>
                </form>
                <div class="row clearfix">
                    <div class="column half">
                        <h2>Boeken</h2>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Titel
                                    </td>
                                    <td >
                                        Genre
                                    </td>
                                    <td>
                                        Jaar
                                    </td>
                                </tr>
                                <c:forEach var="boek" items="${requestScope.boeken}">
                                    <tr>
                                        <td>
                                            <c:out value="${boek.titel}">
                                            </c:out>
                                        </td>
                                        <td class="lowercase">
                                            <c:out value="${fn:toLowerCase(boek.genre)}">
                                            </c:out>
                                        </td>
                                        <td>
                                            <c:out value="${boek.jaar}">
                                            </c:out>
                                        </td>
                                    </tr>            
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <div class="column half">
                        <h2>DVDs</h2>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Titel
                                    </td>
                                    <td >
                                        Genre
                                    </td>
                                    <td>
                                        Jaar
                                    </td>
                                </tr>
                                <c:forEach var="dvd" items="${requestScope.dvds}">
                                    <tr>
                                        <td>
                                            <c:out value="${dvd.titel}">
                                            </c:out>
                                        </td>
                                        <td class="lowercase">
                                            <c:out value="${fn:toLowerCase(dvd.genre)}">
                                            </c:out>
                                        </td>
                                        <td>
                                            <c:out value="${dvd.jaar}">
                                            </c:out>
                                        </td>
                                    </tr>            
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="container centertext">
                Ben Meulemans - 2Ti4
            </div>
        </footer>
    </body>
</html>

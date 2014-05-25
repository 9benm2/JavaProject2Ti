<%-- 
    Document   : boeken
    Created on : May 20, 2014, 10:31:17 AM
    Author     : BTO-Ben
--%>



<%@page import="info.toegepaste.www.entity.Genre"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
                $('select option[value="' + $("#genrewaarde").html() + '"]').attr("selected", "selected");
                $("input[type=submit], button").button();
                $('option[value=' + $("#genrewaarde").html() + ']').attr("selected", "selected");
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overzicht artikels</title>
    </head>
    <body>
        <header class="clearfix centertext">
            <div class="container">
                <div class="column two-thirds">
                    <h1>Mediatheek Applicatie</h1>
                </div>
                <div class="column third">
                    <form method="GET" action="ManageServlet">
                        <div class="aanmeldpadding">
                            <c:if test="${sessionScope.lid != null}">
                                <label>Welkom ${sessionScope.lid.voornaam}</label> <br>
                                <input class="aanmeldinput" type="submit" value="Afmelden" name="afmelden"/>
                            </c:if>
                            <c:if test="${sessionScope.lid == null}">
                                <input class="aanmeldinput littlebotmargin" type="text" name="lidnummer" placeholder="Lidnummer"/>
                                <input class="aanmeldinput" type="submit" value="Aanmelden" name="aanmelden"/>
                                <input class="aanmeldinput" type="submit" value="Registreren" name="nieuwLid"/>
                            </c:if>
                        </div>
                    </form>
                </div>
            </div>
        </header>
        <div class="hidden"><span id="genrewaarde"><c:out value="${requestScope.genre}" /></span></div>
        <section>
            <div class="container">
                <form method="GET" action="ManageServlet">
                    <div class="row clearfix">
                        <div class="column third littlepadding">
                            <label class="overzichtlabel" for="zoeken">Zoeken:</label>
                            <input class="overzichtinput" id="zoeken" type ="text" name="titel" value="<c:out value="${requestScope.titel}" />">
                        </div>
                        <div class="column third littlepadding">
                            <label class="overzichtlabel" for="genre">Genre:</label>
                            <select class="overzichtinput lowercase" name="genre" id="genre">
                                <option>Alle</option>
                                <%for (Genre genre : Genre.values()) {
                                %>
                                <option class="lowercase" value="<%=genre%>"><%=genre.toString().toLowerCase()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="column third rightalign littlepadding">
                            <label class="overzichtlabel" for="jaar">Jaar:</label>
                            <input class="overzichtinput" type="text" name="jaar" id="jaar" value="<c:out value="${requestScope.jaar}"/>">
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="column half littlepadding">
                            <label class="overzichtlabelhalf" for="auteur">Auteur:</label>
                            <input class="overzichtinputhalf" type="text" name="auteur" id="auteur" value="<c:out value="${requestScope.auteur}"/>">
                        </div>
                        <div class="column half rightalign littlepadding">
                            <label class="overzichtlabelhalf" for="regisseur">Regisseur:</label>
                            <input class="overzichtinputhalf" type="text" name="regisseur" id="regisseur" value="<c:out value="${requestScope.regisseur}"/>">                            
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
                                        Auteur
                                    </td>
                                    <td>
                                        Jaar
                                    </td>
                                </tr>
                                <c:forEach var="boek" items="${requestScope.boeken}">
                                    <tr>
                                        <td>
                                            <a href="ManageServlet?detail=boek&id=${boek.id}">
                                                <c:out value="${boek.titel}"/></a>
                                        </td>
                                        <td class="lowercase">
                                            <c:out value="${fn:toLowerCase(boek.genre)}">
                                            </c:out>
                                        </td>
                                        <td>
                                            <c:out value="${boek.auteur}">
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
                                        Regisseur
                                    </td>
                                    <td>
                                        Jaar
                                    </td>
                                </tr>
                                <c:forEach var="dvd" items="${requestScope.dvds}">
                                    <tr>
                                        <td>
                                            <a href="ManageServlet?detail=dvd&id=${dvd.id}">
                                                <c:out value="${dvd.titel}"/></a>
                                        </td>
                                        <td class="lowercase">
                                            <c:out value="${fn:toLowerCase(dvd.genre)}">
                                            </c:out>
                                        </td>
                                        <td>
                                            <c:out value="${dvd.regisseur}">
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

<%-- 
    Document   : index
    Created on : May 20, 2014, 10:30:43 AM
    Author     : BTO-Ben
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic Page Needs -->
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Mediatheek - Detail</title>

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
                $("input[type=submit], button, .button").button();
            });
            function goBack()
            {
                window.history.go(-1);
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <section>
            <div class="container">
                <div class="row clearfix">
                    <div class="column third">

                        <button id="overzichtlink" class="button center" onclick="goBack()">Terug naar overzicht</button>
                    </div>
                    <div class="column two-thirds">
                        <h2>${artikel.titel}</h2>
                        <div class="CSSTableGenerator">
                            <table>
                                <tr>
                                    <td>Titel</td>
                                    <!-- extra kolommen naargelang het dvd of boek is -->
                                    <!-- Als het DVD is: -->
                                    <c:if test="${sessionScope.type == 'DVD'}">
                                        <td>Regisseur</td>
                                    </c:if>
                                    <c:if test="${sessionScope.type == 'Boek'}">
                                        <td>Auteur</td>
                                        <td>Aantal paginas</td>
                                    </c:if>
                                    <td>Genre</td>
                                    <td>Jaar</td>
                                </tr>
                                <tr>
                                    <td>${artikel.titel}</td>
                                    <c:if test="${sessionScope.type == 'Boek'}">
                                        <td>${artikel.auteur}</td>
                                        <td>${artikel.aantalpaginas}</td>
                                    </c:if>
                                    <c:if test="${sessionScope.type == 'DVD'}">
                                        <td>${artikel.regisseur}</td>
                                    </c:if>
                                    <td class="lowercase">${fn:toLowerCase(artikel.genre)}</td>
                                    <td>${artikel.jaar}</td>
                                </tr>
                            </table>
                        </div>
                        <form class="morepadding" method="GET" action="ManageServlet">
                            <input class="hidden" name="id" value="${artikel.id}"/>
                            <label class="detaillabel" for="lidnr">Lidnummer:</label><input class="detailinput" type="text" name="lidnr" id="lidnr" value="${sessionScope.lid.lidnummer}"/><input id="nieuwLid" type="submit" name="nieuwLid" value="Nog geen lidnummer?"/><br>
                            <div class="littlepadding">
                                <label class="detaillabel"></label><input class="detailinput" type="submit" name="uitlenen" value="Uitlenen"/>
                            </div>
                        </form>
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

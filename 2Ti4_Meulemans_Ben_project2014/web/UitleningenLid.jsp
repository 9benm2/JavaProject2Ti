<%-- 
    Document   : index
    Created on : May 20, 2014, 10:30:43 AM
    Author     : BTO-Ben
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic Page Needs -->
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Mediatheek - home</title>

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
                if ("<c:out value="${melding}"></c:out>" !== "") {
                    $(".melding").show();
                    $(".melding").html("<c:out value="${melding}"></c:out>");
                } else {
                    $(".melding").hide();
                }
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
                                <input class="aanmeldinput littlebotmargin" type="text" name="lidnummer" placeholder="Lidnummer"/> <br>
                                <input class="aanmeldinput" type="submit" value="Aanmelden" name="aanmelden"/><br>
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
                        <button id="overzichtlink" class="button center" onclick="goBack()">Terug</button>
                    </div>

                    <div class="column two-thirds">
                        <div class="melding">
                        </div>

                        <h2>Uitleningen</h2>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Artikel
                                    </td>
                                    <td>
                                        Lid
                                    </td>
                                    <td >
                                        Uitleendatum
                                    </td>
                                </tr>
                                <c:forEach var="uitlening" items="${requestScope.uitleningen}">
                                    <tr>
                                        <td>
                                            <c:out value="${uitlening.artikel.titel}"/></a>
                                        </td>
                                        <td>
                                            <c:out value="${uitlening.lid.voornaam}">
                                            </c:out>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${uitlening.uitleenDatum.time}" type="date" pattern="dd/MM/yyyy"/>
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

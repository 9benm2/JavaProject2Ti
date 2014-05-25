<%-- 
    Document   : index
    Created on : May 20, 2014, 10:30:43 AM
    Author     : BTO-Ben
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                if ("<c:out value="${fout}"></c:out>" !== "") {
                    $(".fout").show();
                    $(".fout").html("<c:out value="${fout}"></c:out>");
                } else {
                    $(".fout").hide();
                }
                if ("<c:out value="${melding}"></c:out>" !== "") {
                    $(".melding").show();
                    $(".melding").html("<c:out value="${melding}"></c:out>");
                } else {
                    $(".melding").hide();
                }
            });
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
                    <div class="column full">
                        <div class="fout">
                        </div>
                        <div class="melding">
                        </div>
                        <c:if test="${sessionScope.lid.familienaam == 'password'}">
                            <div class="row clearfix">
                                <form method="GET" action="ManageServlet">
                                    <div class="column third">
                                        <input class="center" type="submit" name="beheerArtikels" value="Beheer artikels"/>
                                    </div>
                                    <div class="column third">
                                        <input class="center" type="submit" name="beheerLeden" value="Beheer leden"/>
                                    </div>
                                    <div class="column third">
                                        <input class="center" type="submit" name="beheerUitleningen" value="Beheer uitleningen"/>

                                    </div>
                                </form>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.artikel != null}">
                            <a class="center button" href="ManageServlet?detail=${sessionScope.type.toLowerCase()}&id=${sessionScope.artikel.id}">Naar laatst bezocht artikel</a>
                        </c:if>
                        <p>Welkom op de uitleen applicatie van de mediatheek. Via onderstaande knop kan u alle artikels in onze mediatheek bekijken.</p>
                        <form method="GET" action="ManageServlet">
                            <input class="center" type="submit" name="overzicht" value="Overzicht artikels">
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

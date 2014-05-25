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
                        <div class="center">
                            <h2>Beheer lid</h2>
                            <form method="GET" action="ManageServlet">
                                <span class="hidden"><input class="mediuminput littlebotmargin" type="text" name="id" value="${requestScope.lid.id}"/></span> <br>
                                <label class="mediuminput" for="lidnummer">Lidnummer:</label><input disabled="disabled" name="lidnummer" class="mediuminput littlebotmargin" type="text" value="${requestScope.lid.lidnummer}"/> <br>
                                <label class="mediuminput" for="lidnummer">E-mail:</label><input name="email" class="mediuminput littlebotmargin" type="text" value="${requestScope.lid.email}"/> <br>
                                <label class="mediuminput" for="lidnummer">Voornaam:</label><input name="voornaam" class="mediuminput littlebotmargin" type="text" value="${requestScope.lid.voornaam}"/> <br>
                                <label class="mediuminput" for="lidnummer">Familienaam:</label><input name="familienaam" class="mediuminput littlebotmargin" type="text" value="${requestScope.lid.familienaam}"/> <br>
                                <a href="ManageServlet?verwijderLid=ja&lidId=${requestScope.lid.id}" class="mediuminput button">Verwijderen</a><input class="mediuminput" type="submit" value="Opslaan" name="opslaanLid"/><br>
                                <a href="ManageServlet?uitleningenLidId=${requestScope.lid.id}" class="mediuminput button">Raadpleeg uitleningen</a>

                            </form>
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

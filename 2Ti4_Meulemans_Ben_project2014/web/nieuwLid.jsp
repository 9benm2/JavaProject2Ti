<%-- 
    Document   : index
    Created on : May 20, 2014, 10:30:43 AM
    Author     : BTO-Ben
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic Page Needs -->
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Mediatheek - Nieuw lid</title>

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
                        <button id="overzichtlink" class="button" onclick="goBack()">Terug naar artikel</button>
                    </div>
                    <div class="column two-thirds">
                        <h2>Registratie nieuw lid</h2>
                        <form method="GET" action="ManageServlet">
                            <label for="email" class="littlepadding detaillabel">E-mail</label><input class="mediuminput" type="text" id="email" name="email"/><br>
                            <label for="voornaam" class="littlepadding detaillabel">Voornaam</label><input class="mediuminput" type="text" id="voornaam" name="voornaam"/><br>
                            <label for="familienaam" class="littlepadding detaillabel">Familienaam</label><input class="mediuminput" type="text" id="familienaam" name="familienaam"/><br>
                            <div class="littlepadding">
                                <label class="detaillabel"></label><input class="mediuminput" type="submit" value="Registreren" name="registreren"/>
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

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
                $("input[type=submit], button").button();
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overzicht artikels</title>
    </head>
    <body>
        <header class="clearfix centertext">
            <div class="container">
                <h1>Mediatheek - Overzicht artikels</h1>
            </div>
        </header>
        <section>
            <div class="container">
                <div class="row clearfix">
                    <div class="column full">
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Titel
                                    </td>
                                    <td >
                                        Title 2
                                    </td>
                                    <td>
                                        Title 3
                                    </td>
                                </tr>
                                <c:forEach var="boek" items="${requestScope.boeken}">
                                    <tr>
                                        <td>
                                            <c:out value="${boek.titel}">
                                            </c:out>
                                        </td>
                                        <td>
                                            Row 1
                                        </td>
                                        <td>
                                            Row 1
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

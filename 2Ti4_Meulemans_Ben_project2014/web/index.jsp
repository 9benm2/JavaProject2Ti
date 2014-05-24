<%-- 
    Document   : index
    Created on : May 20, 2014, 10:30:43 AM
    Author     : BTO-Ben
--%>





<!DOCTYPE html>
<html>
    <head>
        <!-- Basic Page Needs -->
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Pas ook meta description aan</title>
        <meta name="description" content="xxxxxxxxxxxxxxxxx">

        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS
        <link rel="stylesheet" href="animate.css" type="text/css"> -->
        <link rel="stylesheet" href="normalize.css" type="text/css">
        <link rel="stylesheet" href="style.css" type="text/css">

        <!-- Scripts 
        <script type="text/javascript" src="jquery-1.11.0.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#test').addClass('animated');
                $('#test').addClass('fadeInDown');                
            });
        </script>-->
    </head>
    <body>
        <header class="clearfix centertext">
            <div class="container">
                <h1>Title</h1>
            </div>
        </header>
        <section>
            <div class="container">
                <div class="row clearfix">
                    <div id="test" class="column half">
                        test
                    </div>
                    <div class="column half">
                        <img src="images/test.png" alt="testImage"/>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mediatheek</h1>
        <form method="GET" action="ManageServlet">
            <input type="submit" name="boeken" value="Overzicht boeken">
        </form>
        <footer>Ben Meulemans - 2Ti4</footer>
    </body>
</html>

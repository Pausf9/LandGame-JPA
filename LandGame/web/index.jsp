<%-- 
    Document   : index
    Created on : 20-nov-2016, 14:41:34
    Author     : Pau
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload='redirect()'>
        <script>
            function redirect() {
                window.location = "${pageContext.request.contextPath}/ServletCookies";
            }
        </script>
    </body>
</html>
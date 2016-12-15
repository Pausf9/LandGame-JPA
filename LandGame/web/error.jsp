<%-- 
    Document   : error
    Created on : 27-nov-2016, 23:08:36
    Author     : Pau
--%>
<%String respuesta = (String) request.getAttribute("respuesta");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <title>INFORM</title>
    </head>
    <body>
        <div id="loginmenu">
            <div class="containermenu">
                <div>
                    <h2><%=respuesta%></h2>
                    <br />
                    <form  action="${pageContext.request.contextPath}/index.jsp" name="formsign">
                        <div class="ads">google ads</div>
                        <input type="submit"  class="Btn" value="Return"/>
                        <br/>
                    </form >
                </div>
               
            </div>
        </div>
        
    </body>
</html>

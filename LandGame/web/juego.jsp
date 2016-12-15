<%-- 
    Document   : index
    Created on : 20-nov-2016, 16:20:45
    Author     : Pau
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="queryclass.Ranking"%>
<%@page import="queryclass.OnlinePlayer"%>
<%@page import="queryclass.Played"%>
<%@page import="java.util.ArrayList"%>
<%ArrayList<OnlinePlayer> lastlogin = (ArrayList<OnlinePlayer>) request.getAttribute("onlinelast");%>
<%ArrayList<Ranking> rankingJuego = (ArrayList<Ranking>) request.getAttribute("ranking");%>
<%ArrayList<Played> play = (ArrayList<Played>) request.getAttribute("played");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
        <title>Lunar Landing in HTML5</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/lunar.js"></script>  
        <script type="text/javascript">
            function showonlyone(theform) {
                $('.hideform').each(function (index) {
                    if ($(this).attr("id") == theform) {
                        $(this).show(0);
                    } else {
                        $(this).hide(0);
                    }
                });
            }
            function clckl1() {
                document.getElementById('li1').style.color = 'white';
                document.getElementById("li2").style.color = 'green';
                document.getElementById("li3").style.color = 'green';
                document.getElementById("li4").style.color = 'green';
                document.getElementById("li5").style.color = 'green';
            }
            function clckl2() {
                document.getElementById('li1').style.color = 'green';
                document.getElementById("li2").style.color = 'white';
                document.getElementById("li3").style.color = 'green';
                document.getElementById("li4").style.color = 'green';
                document.getElementById("li5").style.color = 'green';
            }
            function clckl3() {
                document.getElementById('li1').style.color = 'green';
                document.getElementById("li2").style.color = 'green';
                document.getElementById("li3").style.color = 'white';
                document.getElementById("li4").style.color = 'green';
                document.getElementById("li5").style.color = 'green';
            }
            function clckl4() {
                document.getElementById('li1').style.color = 'green';
                document.getElementById("li2").style.color = 'green';
                document.getElementById("li3").style.color = 'green';
                document.getElementById("li4").style.color = 'white';
                document.getElementById("li5").style.color = 'green';
            }
            function clckl5() {
                document.getElementById('li1').style.color = 'green';
                document.getElementById("li2").style.color = 'green';
                document.getElementById("li3").style.color = 'green';
                document.getElementById("li4").style.color = 'green';
                document.getElementById("li5").style.color = 'white';
            }


            function limpiar() {
                document.getElementById("mostrarUsuario2").value = "";
                checkCookie();
                var f = new Date();
                var dia = f.getDate();
                document.getElementById("iniciod").value = dia;
                var mes = f.getMonth();
                document.getElementById("iniciom").value = mes;
                var year = f.getFullYear();
                document.getElementById("inicioy").value = year;
                var hora = f.getHours();
                document.getElementById("inicioh").value = hora;
                var min = f.getMinutes();
                document.getElementById("iniciomi").value = min;
                var seg = f.getSeconds();
                document.getElementById("inicios").value = seg;
                //alert("hora: "+hora+" minutos: "+min+" seg: "+seg)
            }
            function getPoint() {
                var point = document.getElementById("point").innerText;
                document.getElementById("mostrarUsuario2").value = point;
                var f = new Date();
                var dia = f.getDate();
                document.getElementById("finald").value = dia;
                var mes = f.getMonth();
                document.getElementById("finalm").value = mes;
                var year = f.getFullYear();
                document.getElementById("finaly").value = year;
                var hora = f.getHours();
                document.getElementById("finalh").value = hora;
                var min = f.getMinutes();
                document.getElementById("finalmi").value = min;
                var seg = f.getSeconds();
                document.getElementById("finals").value = seg;
                //alert("hora: "+hora+" minutos: "+min+" seg: "+seg);
            }
            function checkCookie() {
                var user = getCookie("name");
                if (user != "") {
                    document.getElementById("nick").innerText = user;
                    var id = getCookie("iduser");
                    document.getElementById("useid").value = id;
                } else {
                    window.location = "${pageContext.request.contextPath}/menu.jsp";
                }
            }
            function deleteAllCookies() {
                var cookies = document.cookie.split(";");

                for (var i = 0; i < cookies.length; i++) {
                    var cookie = cookies[i];
                    var eqPos = cookie.indexOf("=");
                    var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
                    document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
                    window.location = "${pageContext.request.contextPath}/menu.jsp";
                }
            }
            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }
        </script>
    </head>
    <body onload="limpiar()">
        <div id="login1" >
            <div class="container1">
                <label>Player: <p id="nick"></p></label> 
                <input name="namenick" class="invi" id="idnick" />
            </div><!--end container1-->
        </div><!--end login1-->
        <div id="state">
            <div class="container">
                <ul>
                    <a  href="javascript:showonlyone('gameover');" >
                        <li id="li1" onclick="clckl1()">Game Over</li>
                    </a>
                    <li> &nbsp; &nbsp;</li>
                    <a  href="javascript:showonlyone('top');" >
                        <li id="li5" onclick="clckl5()">Most Played</li>
                    </a>
                    <li> &nbsp; &nbsp;</li>
                    <a  href="javascript:showonlyone('ranking');" >
                        <li id="li2" onclick="clckl2()">Ranking</li>
                    </a>
                    <li> &nbsp; &nbsp;</li>
                    <a  href="javascript:showonlyone('online1');" >
                        <li id="li3" onclick="clckl3()">Players</li>
                    </a>
                    <li> &nbsp; &nbsp;</li>
                    <a  href="javascript:showonlyone('logout');" >
                        <li id="li4" onclick="clckl4()">Log out</li>
                    </a>
                </ul>
                <br/>
                <br/>
                <div class="hideform" id="gameover">
                    <form method="GET" action="${pageContext.request.contextPath}/ServletResultado">
                        <h1 id="resultado"></h1>
                        <h2 id="point"></h2>
                        <div class="ads">google ads
                            <input type="text" class="invi" id="mostrarUsuario2" name="mostrarPunto"/>
                            <input id="useid" class="invi" name="codigo" type="text"/>
                            <input id="iniciod" class="invi" name="iniciod" type="text"/>
                            <input id="iniciom" class="invi" name="iniciom" type="text"/>
                            <input id="inicioy" class="invi" name="inicioy" type="text"/>
                            <input id="inicioh" class="invi" name="inicioh" type="text"/>
                            <input id="iniciomi" class="invi" name="iniciomi" type="text"/>
                            <input id="inicios" class="invi" name="inicios" type="text"/>
                            <input id="finald" class="invi" name="finald" type="text"/>
                            <input id="finalm" class="invi" name="finalm" type="text"/>
                            <input id="finaly" class="invi" name="finaly" type="text"/>
                            <input id="finalh" class="invi" name="finalh" type="text"/>
                            <input id="finalmi" class="invi" name="finalmi" type="text"/>
                            <input id="finals" class="invi" name="finals" type="text"/>
                        </div>
                        <input type="submit" class="Btn" onclick="getPoint()" value="Play again">
                    </form>
                </div><!--end div gameover-->
                <div class="hideform" id="top" style="display: none;">
                    <h3>MOST PLAYED</h3>
                    <!--rs rankingJuego -->
                    <div class="scroll" id="mtable">
                        <center><table>
                                <tr>
                                    <th>PLAYER</th>
                                    <th>PLAYED</th>
                                    <th>POSITION</th>
                                </tr>

                                <%
                                    for (int i = 0; i < play.size(); i++) {
                                        out.print("<tr>");
                                        out.print("<td>" + play.get(i).getPlayer() + "</td>");
                                        out.print("<td>" + play.get(i).getCount() + "</td>");
                                        out.print("<td>" + (i + 1) + "</td>");
                                        out.print("</tr>");
                                    }
                                %>    
                            </table></center>
                    </div>
                    <br/>  
                </div><!--end div top-->
                <div class="hideform" id="ranking" style="display: none;">
                    <h3>RANKING</h3>
                    <!--rs rankingJuego -->
                    <div class="scroll" id="mtable">
                        <center><table style="overflow-y: scroll">
                                <tr>
                                    <th>PLAYER</th>
                                    <th>POINTS</th>
                                    <th>POSITION</th>
                                </tr>

                                <%
                                    for (int i = 0; i < rankingJuego.size(); i++) {
                                        out.print("<tr>");
                                        out.print("<td>" + rankingJuego.get(i).getPlayer() + "</td>");
                                        out.print("<td>" + rankingJuego.get(i).getPoint() + "</td>");
                                        out.print("<td>" + (i + 1) + "</td>");
                                        out.print("</tr>");
                                    }
                                %>    
                            </table></center>
                    </div>
                    <br/>  
                </div><!--end div ranking-->    
                <div class="hideform" id="online1" style="display: none;">
                    <h3>LAST LOGIN</h3>
                    <div class="scroll" id="mtable">
                        <center><table >
                                <tr>
                                    <th>PLAYER</th>
                                    <th>LAST LOGIN</th>
                                </tr>
                                <%
                                    for (int i = 0; i < lastlogin.size(); i++) {
                                        out.print("<tr>");
                                        out.print("<td>" + lastlogin.get(i).getPlayer() + "</td>");
                                        out.print("<td>" + lastlogin.get(i).getLastLogin() + "</td>");
                                        out.print("</tr>");
                                    }
                                %>
                            </table></center>
                    </div>
                </div><!--end div online-->
                <div class="hideform" id="logout" style="display: none;">
                    <h3>LOG OUT</h3>
                    <div class="ads">google ads</div>
                    <input class="Btn" onclick="deleteAllCookies()" style="width: 60px;" value="Log out">
                </div><!--end div logout-->
            </div>
        </div>
        <div id="game">
            <div id="gauge"><div></div></div>
            <div id="ship"></div>
            <div id="explode"></div>
            <div id="moon">
                <div id="landing-pad"><div id="ms">-</div></div>
            </div>
        </div>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-41665373-8', 'auto');
            ga('send', 'pageview');
        </script>
    </body>
</html>
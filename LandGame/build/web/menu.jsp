<%-- 
    Document   : menu
    Created on : 26-nov-2016, 1:02:47
    Author     : Pau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Lander Menu</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
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
                document.getElementById("li2").style.color = '#FF9509';
            }

            function clckl2() {

                document.getElementById('li1').style.color = '#FF9509';
                document.getElementById("li2").style.color = 'white';
            }

            document.forms["form"].addEventListener("input", function (e) {

                var input = this.querySelector("input[name=usersign]");
                var not = input.value.match(/[^a-zA-Z0-9]/);
                if (not) {
                    not.forEach(function (text) {
                        input.value = input.value.replace(text, "")
                    })
                }
            })

            document.forms["form"].addEventListener("input", function (e) {

                var input = this.querySelector("input[name=passsign]");
                var not = input.value.match(/[^a-zA-Z0-9]/);
                if (not) {
                    not.forEach(function (text) {
                        input.value = input.value.replace(text, "")
                    })
                }
            })

            function checkCookie() {

                var user = getCookie("name");
                var pwd = getCookie("pass");
                if (user != "") {
                    document.getElementById("loginuser").value = user;
                    document.getElementById("loginpass").value = pwd;
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

            function validateForm() {

                var pass = document.forms["formsign"]["passsign"].value;
                var cpass = document.forms["formsign"]["cpasssign"].value;
                if (pass != cpass) {
                    document.getElementById("ps2").style.border = "1px solid red";
                    document.getElementById("pslabel").innerText = "Password do not match.";
                    document.getElementById("pslabel").style.color = "red";
                    //alert("passwords don't macth!");
                    return false;
                }
                if (document.forms["formsign"]["passsign"].value != "" && document.forms["formsign"]["passsign"].value == document.forms["formsign"]["cpasssign"].value) {
                    if (document.forms["formsign"]["passsign"].value == document.forms["formsign"]["usersign"].value) {
                        //alert("Error: Password must be different from Username!");
                        return false;
                    }
                    re = /[0-9]/;
                    if (!re.test(document.forms["formsign"]["passsign"].value)) {
                        //alert("Error: password must contain at least one number (0-9)!");
                        return false;
                    }
                    re = /[a-z]/;
                    if (!re.test(document.forms["formsign"]["passsign"].value)) {
                        //alert("Error: password must contain at least one lowercase letter (a-z)!");
                        return false;
                    }
                    re = /[A-Z]/;
                    if (!re.test(document.forms["formsign"]["passsign"].value)) {
                        alert("Error: password must contain at least one uppercase letter (A-Z)!");
                        return false;
                    }
                }
                document.getElementById("pslabel").innerText = "Confirm Password";
                document.getElementById("pslabel").style.color = "green";
            }
        </script>
    </head>
    <body onload="checkCookie()">
        <div id="loginmenu">
            <div class="containermenu">
                <ul>
                    <a  href="javascript:showonlyone('formsign');" >
                        <li id="li1" onclick="clckl1()">Sign up</li>
                    </a>
                    <li> &nbsp; &nbsp;</li>
                    <a  href="javascript:showonlyone('formlog');" >
                        <li id="li2" onclick="clckl2()">Log in</li>
                    </a>
                </ul>
                <br/>
                <br/>
                <div class="hideform" id="formsign">
                    <h2>Sign up</h2>
                    <br />
                    <form method="POST" onsubmit="return validateForm()" action="${pageContext.request.contextPath}/DBServlet" name="formsign">
                        <!-- onsubmit="validatePass(this);"-->
                        <center>
                            <table >
                                <tr>
                                    <td>
                                        <label>User</label>
                                    </td>
                                </tr>
                                <tr >
                                    <td>
                                        <input type="text" title="Please only use letters (A-Z, any case) or numbers(0-9) when entering your username." placeholder="User" name="usersign"  pattern="[a-zA-Z0-9]+" value="" required="required" />
                                    </td>
                                    <td>
                                        <label id="labeluser"></label>
                                    </td>
                                </tr>
                                <tr >
                                    <td>
                                        <label>Password</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="password" title="Please only use letters (A-Z, any case) or numbers(0-9) when entering your password." placeholder="Password"  id="ps1" name="passsign" pattern="[a-zA-Z0-9]+" value="" required="required" />
                                    </td>
                                    <td>
                                        <label id="labelpass"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label id="pslabel">Confirm Password</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td> 
                                        <input type="password" title="Please only use letters (A-Z, any case) or numbers(0-9) when entering your password." placeholder="Confirm Password" id="ps2" name="cpasssign"  pattern="[a-zA-Z0-9]+" value="" required="required" />
                                    </td>
                                    <td>
                                        <label id="labelcpass"></label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                        <input type="submit"  class="Btn" value="Sign Up"/>
                    </form >
                </div>
                <div class="hideform" id="formlog"  style="display:none;">
                    <h2>Log in</h2>
                    <br/>
                    <form method="GET" name="formlogin" action="${pageContext.request.contextPath}/DBServlet"   >
                        <center>
                            <table>
                                <tr>
                                    <td>
                                        <label>User</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td> 
                                        <input type="text" name="userlog" placeholder="User"  id="loginuser" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Password</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="password" name="passlog" placeholder="Password" id="loginpass" required="required" />
                                    </td>
                                </tr>
                            </table>
                        </center>
                        <input type="submit" class="Btn"  value="Log In"/>
                        <br/>
                    </form >
                </div>
            </div>
        </div>
    </body>
</html>
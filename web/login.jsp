<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="main">
            <input type="checkbox" id="chk" aria-hidden="true"> <div class="signup">
                <form action="login" method="post">
                   <s:if test="ctr>0">
                         <span style="color: white;padding: 40px;font-weight: 700;font-size:15px;"><s:property value="msg" /></span>
                 </s:if>
        <s:else>
            <span style="color: "><s:property value="msg" /></span>
        </s:else>
             <span style="color: green;">${sessionScope.ErrorMsg}</span>
             
                    <label for="chk" aria-hidden="true">Login</label>
                    <input autocomplete="off" type="text" name="userName" placeholder="UserName" required="">
                    <input autocomplete="off" type="password" name="password" placeholder="Password" required="">
                    <button type="submit">Login</button>
                </form>
            </div> <div class="login">
                <form action="registerUser" method="post">
                    <label for="chk" aria-hidden="true">Register User</label>
                    <input autocomplete="off" type="text" name="userName" placeholder="User name" required="">
                    <input autocomplete="off" type="text" name="email" placeholder="Email" required="">
                    <input autocomplete="off" type="password" name="password" placeholder="Password" required=""><button type="submit">Sign up</button>
                </form>
              
            </div>
        </div>
    </body>
</html>


<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ExaDine Login</title>
        <meta name="google-signin-client_id" content="712965236037-igrai07uhkr7505kguf3sper1ae6h5u1.apps.googleusercontent.com">
        <!--<meta name="google-signin-scope" content="profile email">-->
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script>
            var clicked = false;//Global Variable
            function ClickLogin()
            {
                clicked = true;
            }
            function onSignIn(googleUser) {
                if (clicked) {
                    var profile = googleUser.getBasicProfile();
                    var id_token = googleUser.getAuthResponse().id_token;
                    var email = profile.getEmail();
                    var fullName = profile.getName();
                    $.ajax({

                        url: 'registerGoogleUser',
                        method: 'GET',
                        data: {email: email, fullName: fullName},
                        success: function (resultText) {
//                        $('#result').html(resultText);
                            window.location.href = "index";

                        },

                        error: function (jqXHR, exception) {
                            console.log('Error occured!!');
                        }
                    });
                }

                function signOut() {
                    alert("Sign out");
                    var auth2 = gapi.auth2.getAuthInstance();
                    auth2.signOut().then(function () {
                        console.log('User signed out.');
                    });
                }
            }
        </script>
        <div class="main">

            <input type="checkbox" id="chk" aria-hidden="true"> <div class="signup">

                <form action="login" >
                    <div class="g-signin2 social_signin" data-longtitle="true" onclick="ClickLogin()" data-onsuccess="onSignIn"></div>
                    <a href="#" onclick="signOut();">Sign out</a>
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


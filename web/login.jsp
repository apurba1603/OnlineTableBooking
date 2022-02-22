<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            .signup{
                position: relative;
                width:94%;
                height: 96%;
            }
            i {
                position: absolute;
                top: 179px;
                right: 65px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <input type="checkbox" id="chk" aria-hidden="true">



            <div class="signup">
                <form action="login" method="post">
                    <label for="chk" aria-hidden="true">Login</label>
                    <input type="text" id="username" name="userName" placeholder="User Name" required="">
                    <input type="password" id="password" name="password" placeholder="Password" required="">
                    <i class="bi bi-eye-slash" id="togglePassword"></i>
                    <button type="submit">Login</button>
                </form>
            </div>



            <div class="login">
                <form action="registerUser" method="post">
                    <label for="chk" aria-hidden="true">Register User</label>

                    <input type="text" id="username" name="userName" placeholder="User Name" required="">
                    <input type="password" id="passwordSignUp" name="password" placeholder="Password" required="">
                    <i  class="bi bi-eye-slash" id="togglePasswordSignUp" style="top: 179px"></i>
                    <input type="text" id="confirm_pass" name="confirm_pass" placeholder="Confirm Password" onkeyup="validate_password()" required="">
                    <button id="btnSignUp" type="submit">Sign Up</button>
                    <span style="display: flex; justify-content: center;" id="wrong_pass_alert"></span>
                </form>
            </div>
        </div>
        <script>
//            *** for sign in part ***
            const togglePassword = document.querySelector("#togglePassword");
            const password = document.querySelector("#password");

            togglePassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);

                // toggle the icon
                this.classList.toggle("bi-eye");
            });
//            *** x ***

//            *** for sign up part ***
            const togglePasswordSignUp = document.querySelector("#togglePasswordSignUp");
            const passwordSignUp = document.querySelector("#passwordSignUp");

            togglePasswordSignUp.addEventListener("click", function () {
                // toggle the type attribute
                const type = passwordSignUp.getAttribute("type") === "password" ? "text" : "password";
                passwordSignUp.setAttribute("type", type);

                // toggle the icon
                this.classList.toggle("bi-eye");
            });
//            *** x ***

            function validate_password() {
                var pass = document.getElementById('passwordSignUp').value;
                var confirm_pass = document.getElementById('confirm_pass').value;
                if (pass != confirm_pass) {
                    // prevent form submit
                    document.getElementById("btnSignUp").disabled = true;
                    document.getElementById('wrong_pass_alert').style.color = 'red';
                    document.getElementById('wrong_pass_alert').innerHTML
                            = 'Password did not match';
                    document.getElementById('create').disabled = true;
                    document.getElementById('create').style.opacity = (0.4);
                    
                } else {
                    document.getElementById("btnSignUp").disabled = false;
                    document.getElementById('wrong_pass_alert').style.color = 'green';
                    document.getElementById('wrong_pass_alert').innerHTML =
                            'Password Matched';
                    document.getElementById('create').disabled = false;
                    document.getElementById('create').style.opacity = (1);
                }
            }
        </script>
    </body>
</html>


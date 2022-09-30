import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:moviechitchat/screens/welcome/LoginScreen.dart';
import 'package:moviechitchat/screens/welcome/welcomewidgets/LoginRegisterBG.dart';
import 'package:moviechitchat/utils/CommonUtils.dart';

class RegisterScreen extends StatefulWidget {

  bool isSignUpComplete = false;
  String email = "";
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var email = "";
  var password = "";
  var code = "";

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmationCodeController = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      CommonUtils.showSnackBar("Please provide a email and password", context);
      return;
    }

    try {
      SignUpResult res = await Amplify.Auth.signUp(
        username: email,
        password: password,
      );
      setState(() {
        if (res.isSignUpComplete) {
          widget.email = email;
          widget.isSignUpComplete = true;
          CommonUtils.showSnackBar("Please provide verification code from email", context);
        }
      });
    } on AuthException catch (e) {
      CommonUtils.showSnackBar(e.message, context);
    }
  }

  Future<void> verifyCode(String code, String username) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: username,
          confirmationCode: code
      );
      setState(() {
        if(res.isSignUpComplete) {
          CommonUtils.showSnackBar("Registered", context);
          navigateToLogin();
        }
      });
    } on AuthException catch (e) {
      CommonUtils.showSnackBar(e.message, context);
    }
  }

  void navigateToLogin() {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return LoginScreen();
      },
    ));
  }

  @override
  void initState() {
    debugPrint(">>>>>>>>>>>>>>${Amplify.isConfigured.toString()}");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    passwordController.addListener(() {
      if (passwordController.text.length > 1) {
        password = passwordController.text.toString();
      }
    });

    emailController.addListener(() {
      if (emailController.text.length > 1) {
        email = emailController.text.toString();
      }
    });

    confirmationCodeController.addListener(() {
      if (confirmationCodeController.text.length > 1) {
        code = confirmationCodeController.text.toString();
      }
    });


    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        return false;
      },
      child: Scaffold(
        body: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              widget.isSignUpComplete ?

                  Column(
                    children: [

                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: const Text(
                          "CODE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2661FA),
                              fontSize: 36
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          controller: confirmationCodeController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: "Code"
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.05),

                    ],
                  )
              :

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Email"
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: "Password"
                  ),
                  obscureText: true,
                ),
              ),

              SizedBox(height: size.height * 0.05),

              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    widget.isSignUpComplete
                        ?  verifyCode(code, widget.email)
                        : registerUser(email, password);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(0),
                      textStyle: const TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0))
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ]
                        )
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      widget.isSignUpComplete ? "CONFIRM" : "SIGNUP",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
                  },
                  child: const Text(
                    "Already Have an Account? Sign in",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

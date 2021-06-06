import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kalpas_project/screens/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:kalpas_project/screens/login.dart';
import 'package:kalpas_project/screens/univ/univ.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String reenterpass = '';
  bool isValid = true;

  Future<void> signUpUser() async {
    var url =
        Uri.parse('https://www.postman.com/collections/299632c9a18ed457ba78');

    var response = await http.post(url, headers: {
      'email': 'vdx@vdx.com',
      'password': 'vdx2308',
      'passwordConf': 'vdx2308'
    });
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController reenterController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/photo.png"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 110, 0, 0),
              child: Text(
                "Welcome!!",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: TextFormField(
                              controller: emailController,
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email:',
                                filled: true,
                                fillColor: Colors.grey[300],
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Stack(
                                  alignment: const Alignment(0, 0),
                                  children: <Widget>[
                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      autofocus: false,
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password:',
                                        filled: true,
                                        fillColor: Colors.grey[300],
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                  ])),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: TextFormField(
                              controller: reenterController,
                              obscureText: true,
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Re-enter Password:',
                                filled: true,
                                fillColor: Colors.grey[300],
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 100, right: 100.0),
                            child: TextButton(
                              onPressed: () {
                                email = emailController.text;
                                password = passwordController.text;
                                reenterpass = reenterController.text;
                                if (password != reenterpass) {
                                  isValid = false;
                                } else if (email.length <= 1 ||
                                    password.length <= 11 ||
                                    reenterpass.length <= 1) {
                                  isValid = false;
                                }
                                
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginPage()));
                                
                              },
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                primary: Colors.blue,
                                onSurface: Colors.blue,
                                side: BorderSide(color: Colors.blue, width: 2),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                              ),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 8),
                            child: new Container(
                              height: 3,
                              width: MediaQuery.of(context).size.width / 5.5,
                              color: Colors.grey[400],
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                            ),
                          ),
                          Text("Or Sign Up with"),
                          new Container(
                            height: 3,
                            width: MediaQuery.of(context).size.width / 5.5,
                            color: Colors.grey[400],
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/google-logo.png"),
                                    fit: BoxFit.contain)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("images/facebook-new.png"),
                                    fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Have an account?",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: " SignIn",
                              style: TextStyle(color: Colors.yellow[700]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                })
                        ])),
                      )
                    ],
                  ),
                ))
          ]),
        ));
  }
}

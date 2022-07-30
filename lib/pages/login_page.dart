import 'package:catalouge_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _buttonchange = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: Center(
              child: Image(
                image: AssetImage('images/login_image.jpg'),
                fit: BoxFit.cover,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        _buttonchange = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      width: _buttonchange ? 50 : 150,
                      height: 40,
                      duration: Duration(seconds: 1),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(_buttonchange ? 50 : 8),
                          color: Colors.red),
                      child: _buttonchange
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "L O G I N",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                    ),
                  ),
                  // ElevatedButton(
                  //     style: ButtonStyle(
                  //         minimumSize: MaterialStateProperty.all(Size(150, 40)),
                  //         backgroundColor:
                  //             MaterialStateProperty.all(Colors.white),
                  //         foregroundColor:
                  //             MaterialStateProperty.all(Colors.red)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: Text(
                  //       "L O G I N",
                  //     ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

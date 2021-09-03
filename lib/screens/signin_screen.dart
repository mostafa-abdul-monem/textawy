import 'package:flutter/material.dart';
import 'package:messageme_app/widgets/my_button.dart';

import '../constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5.5,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 50.0,
            ),
            TextField(
              onChanged: (vakue) {},
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                contentPadding: EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: orangeColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenColor, width: 2.0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (vakue) {},
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                contentPadding: EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: orangeColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenColor, width: 2.0)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MyButton(color: greenColor, title: 'SIGN IN', onPressed: () {})
          ],
        ),
      ),
    );
  }
}

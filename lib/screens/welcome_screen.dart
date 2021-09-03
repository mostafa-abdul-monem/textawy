import 'package:flutter/material.dart';
import 'package:messageme_app/constants.dart';
import 'package:messageme_app/widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: Image.asset('images/logo.png'),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Textawy',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35.0,
                      color: Colors.greenAccent[700]),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            MyButton(
              color: orangeColor,
              title: 'SIGN IN',
              onPressed: () {},
            ),
            MyButton(color: greenColor, title: 'REGISTER', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

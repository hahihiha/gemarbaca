import 'package:flutter/material.dart';
import 'loginpage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(seconds: 5), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 107.88,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text.rich(
                TextSpan(
                  children: [
                  TextSpan(
                  text: 'GEMAR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'Alegreya',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'BACA',
                  style: TextStyle(
                    color: Color(0xFF0CBD63),
                    fontSize: 40,
                    fontFamily: 'Alegreya',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
              ),
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

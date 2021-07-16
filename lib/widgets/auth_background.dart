import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _OrangeBox(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          this.child,
        ],
      ),
    );
  }
}

class _OrangeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _orangeBg(),
      child: Stack(
        children: [
          Positioned(
            child: _Bubble(),
            top: 120,
            left: 100,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            left: -30,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -15,
            right: -10,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -50,
            left: 0,
          ),
          Positioned(
            child: _Bubble(),
            top: 30,
            right: 60,
          ),
        ],
      ),
    );
  }

  BoxDecoration _orangeBg() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromRGBO(156, 39, 176, 1),
      Color.fromRGBO(106, 0, 128, 1),
    ]));
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}

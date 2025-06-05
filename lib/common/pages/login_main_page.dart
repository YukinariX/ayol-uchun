import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';

class LoginMainPage extends StatefulWidget {
  final Widget child;
  const LoginMainPage({super.key, required this.child});

  @override
  State<LoginMainPage> createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  double topPosition = -1000;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        topPosition = -700;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.linearToEaseOut,
            top: topPosition,
            left: -200,
            child: Transform.rotate(
              angle: -0.2,
              child: Container(
                height: 1000,
                width: 1000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 120),
                  Text(
                    "Xush kelibsiz!",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: "SFPRODISPLAYREGULAR",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  widget.child,
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
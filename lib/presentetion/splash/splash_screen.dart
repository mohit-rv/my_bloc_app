
import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_mohit/app/app_routes.dart';

import '../../core/local/local_storage.dart';
import '../widget/colors/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    Timer(const Duration(seconds: 4), () {
      if(AuthLocalStorage.isLoggedIn()==true){
        print('navigating to bottomnavScreen');

        Navigator.pushReplacementNamed(
          context,
          AppRoutes.bottomnavScreen,
        );
      }else{
        print('navigating to login');
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.login,
        );
      }

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: sin(_controller.value * pi) * 0.2,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/panda.png',
                height: 160,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'WalkWin',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

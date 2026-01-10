import 'dart:developer';

import 'package:anopolly/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    log("Splash Screen");

    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, "/homescreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10),

              Column(
                children: [
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      height: 170,
                      width: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Image.asset(
                          "assets/anopolly.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Vote Anonymously\nSpeak Freely",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                      shadows: [
                        Shadow(
                          color: AppColors.grey.withAlpha(200),
                          blurRadius: 15,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),

                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              LoadingAnimationWidget.newtonCradle(
                color: AppColors.blue,
                size: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

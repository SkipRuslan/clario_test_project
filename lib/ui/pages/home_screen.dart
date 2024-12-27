import 'package:auto_route/auto_route.dart';
import 'package:clario_test_project/router/app_router.gr.dart';
import 'package:clario_test_project/ui/components/starry_background.dart';
import 'package:clario_test_project/ui/theme/app_colors.dart';
import 'package:clario_test_project/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Color get starColor => AppColors.lightBlue;

  Gradient get backgroundGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.backgroundGradient,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: StarryBackground(
        starColor: starColor,
        backgroundGradient: backgroundGradient,
        child: Center(
          child: InkWell(
            onTap: () => context.router.push(const SignUpRoute()),
            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: Text('Back to Sign up page', style: AppTextStyles.pageTitle)),
          ),
        ),
      ),
    );
  }
}

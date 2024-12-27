import 'package:clario_test_project/ui/theme/app_colors.dart';
import 'package:clario_test_project/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatefulWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const SignUpButton({Key? key, required this.isLoading, required this.onPressed}) : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  final GlobalKey _buttonKey = GlobalKey();
  double? _buttonHeight;

  @override
  void didUpdateWidget(covariant SignUpButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.isLoading && oldWidget.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _measureButtonSize();
      });
    }
  }

  void _measureButtonSize() {
    final RenderBox renderBox = _buttonKey.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      _buttonHeight = renderBox.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: widget.isLoading
            ? SizedBox(
                width: _buttonHeight ?? 50,
                height: _buttonHeight ?? 50,
                child: const CircularProgressIndicator(color: AppColors.darkBlue),
              )
            : InkWell(
                splashColor: AppColors.transparent,
                onTap: widget.isLoading ? null : widget.onPressed,
                child: Container(
                  key: _buttonKey,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: AppColors.blueGradient),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 90.5, vertical: 17),
                  alignment: Alignment.center,
                  child: Text("Sign up", style: AppTextStyles.button),
                ),
              ),
      ),
    );
  }
}

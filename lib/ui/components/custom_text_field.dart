import 'package:clario_test_project/blocs/validation/validators.dart';
import 'package:clario_test_project/ui/theme/app_colors.dart';
import 'package:clario_test_project/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onInputChanged,
    required this.fieldType,
    required this.helperText,
    required this.controller,
    required this.exceptions,
    this.shouldSubmit = false,
    this.shouldShowExceptions = true,
  });

  final String helperText;
  final bool shouldSubmit;
  final FieldType fieldType;
  final bool shouldShowExceptions;
  final Function(String)? onInputChanged;
  final TextEditingController controller;
  final List<ValidatorException>? exceptions;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _fieldState = _focusNode.hasFocus ? FieldState.focused : FieldState.none;
        if (!_isFocused) _isEditing = false;
      });
    });
  }

  bool _isEditing = false;

  bool _obscureText = false;

  FieldState _fieldState = FieldState.none;

  bool get _isFocused => _fieldState == FieldState.focused;

  bool? get _haveExceptions => widget.exceptions?.isNotEmpty;

  TextStyle get _defaultHintStyle => AppTextStyles.textFieldHint;

  TextStyle get _defaultInputTextStyle => AppTextStyles.inputTextStyle;

  String get _obscureTextIconPath => _obscureText ? 'assets/icons/hide_password.png' : 'assets/icons/show_password.png';

  InputDecoration get _defaultInputDecoration => InputDecoration(
        hintText: widget.helperText,
        hintStyle: _defaultHintStyle,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        suffixIcon: widget.fieldType == FieldType.password
            ? IconButton(
                splashRadius: 1,
                splashColor: AppColors.transparent,
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: Image.asset(_obscureTextIconPath, width: 24, height: 24, color: _provideObscureIconColor()),
              )
            : null,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _provideFieldColor(),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _provieBorderColor(), width: 1),
          ),
          child: TextField(
            focusNode: _focusNode,
            enableSuggestions: false,
            obscureText: _obscureText,
            textAlign: TextAlign.start,
            controller: widget.controller,
            onChanged: (value) {
              if (!_isEditing) setState(() => _isEditing = true);
              widget.onInputChanged?.call(value);
            },
            style: _provideInputTextStyle(),
            enableInteractiveSelection: false,
            decoration: _defaultInputDecoration,
            textInputAction: widget.shouldSubmit ? TextInputAction.done : TextInputAction.next,
          ),
        ),
        const SizedBox(height: 8),
        if ((_haveExceptions ?? false) && widget.shouldShowExceptions)
          ...widget.exceptions!.map(
            (e) => Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _provideExceptionMessage(e),
                  style: const TextStyle(color: AppColors.red),
                ),
              ),
            ),
          )
      ],
    );
  }

  Color _provideObscureIconColor() {
    if (_isEditing) AppColors.lightBlue;

    return (_haveExceptions ?? false) ? AppColors.red : AppColors.lightBlue;
  }

  TextStyle _provideInputTextStyle() {
    if (_isEditing || _haveExceptions == null) return _defaultInputTextStyle;

    return (_haveExceptions ?? false)
        ? _defaultInputTextStyle.copyWith(color: AppColors.red)
        : _defaultInputTextStyle.copyWith(color: AppColors.green);
  }

  Color _provieBorderColor() {
    if (_isEditing) return AppColors.darkBlue;

    if (_haveExceptions == null) return AppColors.transparent;

    return (_haveExceptions ?? false) ? AppColors.red : AppColors.green;
  }

  Color _provideFieldColor() {
    if (_haveExceptions == null || _isEditing) return AppColors.white;

    return (_haveExceptions ?? false) ? AppColors.lightRed : AppColors.greenBackground;
  }

  String _provideExceptionMessage(final ValidatorException exception) {
    switch (exception) {
      case ValidatorException.invalidEmail:
        return 'Invalid email address';
      default:
        return 'Something wrong ';
    }
  }
}

enum FieldType { email, password }

enum FieldState { none, focused, error, valid }

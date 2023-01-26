import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.onChanged,
    this.lock = false,
    this.placeholder,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final int? maxLines;
  final void Function(String)? onChanged;
  final bool lock;
  final String? placeholder;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      enabled: !lock,
      onChanged: onChanged,
      controller: controller,
      padding: const EdgeInsets.all(15),
      maxLines: maxLines,
      placeholder: placeholder,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CupertinoColors.systemGrey4,
          width: 2,
        ),
      ),
    );
  }
}

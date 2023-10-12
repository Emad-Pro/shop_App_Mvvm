import 'package:flutter/cupertino.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {Key? key, required this.widget, this.onPressed, this.width, this.height, this.color})
      : super(key: key);
  final VoidCallback? onPressed;
  final Widget? widget;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: CupertinoButton(
          onPressed: onPressed,
          color: color,
          child: widget!,
        ));
  }
}

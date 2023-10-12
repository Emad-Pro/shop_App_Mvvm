import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFiled extends StatefulWidget {
  final Icon? prefixicon;
  final String? hintText;
  final Widget? suffix;
  final TextInputType? typekeyboard;
  final TextEditingController? formFieldController;
  final String? Function(String?)? validate;
  final String? initialValue;
  final int? maxLength;
  final bool? ispassword;
  final bool? readonly;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormFiled(
      {this.hintText,
      this.prefixicon,
      this.suffix,
      this.typekeyboard,
      this.formFieldController,
      this.validate,
      this.ispassword,
      this.readonly,
      this.initialValue,
      this.maxLength,
      this.inputFormatters});

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: TextFormField(
        maxLength: widget.maxLength,
        initialValue: widget.initialValue,
        readOnly: widget.readonly ?? false,
        keyboardType: widget.typekeyboard,
        controller: widget.formFieldController,
        validator: widget.validate,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.ispassword ?? false,
        decoration: InputDecoration(
          prefixIcon: widget.prefixicon,
          hintText: widget.hintText,
          suffixIcon: widget.suffix,
          hintStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.03,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          filled: true,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}

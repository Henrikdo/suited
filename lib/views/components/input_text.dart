import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, required this.hintText,required this.padding});

  final String hintText;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom:padding),
      child: TextFormField(
          
          decoration:  InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: const OutlineInputBorder(), hintText: hintText)),
    );
  }
}

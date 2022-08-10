import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final String hitText;
  final FormFieldValidator<String> validation;
   final TextEditingController controller;
   final String head;
  GestureTapCallback ? onTap;


  DefaultFormField({required this.hitText,required this.validation,required this.controller,required this.head,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          head,
          style:  const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          onTap: onTap,
          controller: controller,
        validator: validation,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none
            ) ,
            focusedBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                color: Colors.grey,
                    width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hitText,
            hintStyle:  const TextStyle(
              fontSize: 16,
              color: Colors.grey,

            )
          ),
        ),
      ],
    );
  }
}

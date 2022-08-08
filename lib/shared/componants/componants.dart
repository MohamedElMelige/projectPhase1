import 'package:flutter/material.dart';


import '../cubit/cubit.dart';



Widget biuldTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('${model['time']}'),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${model['date']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onSubmit,
  var onChange,
  required var validat,
  required String label,
  required IconData prefix,
  var onTap,
  IconData? suffix,
  bool isPassword = false,
  bool isClickable = true,
}) =>
    TextFormField(
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      controller: controller,
      validator: validat,
      enabled: isClickable,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffix: suffix != null ? Icon(suffix) : null,
        labelText: label,
        border: const OutlineInputBorder(),
        prefix: Icon(prefix),
      ),
      keyboardType: type,
    );

import 'package:flutter/material.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: (){},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(Icons.check,size: 22,color: Colors.white,),
                ),
              ),
              const SizedBox(width: 15,),
              const Text('Sign in with Google',style: TextStyle(fontSize: 18),)
            ],
          ),
        )
      ],
    );
  }
}

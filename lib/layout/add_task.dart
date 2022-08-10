
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/componants/default_form_field.dart';

import 'package:flutter_application_1/shared/componants/myButton.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../models/reminder_model.dart';
import '../shared/cubit/state.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();

  final remindController = TextEditingController();
  

  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();

  var dateController = TextEditingController();

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  List<ReminderModel> reminderList = [
    ReminderModel(
      minutes: 10,
      reminder: '10 minutes before',
    ),
    ReminderModel(
      minutes: 30,
      reminder: '30 minutes before',
    ),
    ReminderModel(
      minutes: 60,
      reminder: '1 hour before',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.black,
            )),
        title: const Text(
          'Add Task',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: BlocProvider(
  create: (context) => AppCubit(),
  child: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
        child: Column(
          children: [
            const Divider(height: 2, thickness: 1.5),
            Padding(
              padding: const EdgeInsets.all(30.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultFormField(hitText: 'Enter Task Title ', validation: (val) {
                      if (val!.isEmpty) {
                        return 'Title is empty';
                      } else {
                        return null;
                      }
                    }, controller: titleController, head: 'Title'),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultFormField(
                      onTap: (){
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        ).then((value) {
                          dateController.text = value.toString().split(' ').first;
                        });
                      },
                        hitText: 'Task Date ',
                        validation: (val) {
                      if (val!.isEmpty) {
                        return 'Date is empty';
                      } else {
                        return null;
                      }
                    }, controller: dateController,
                        head: 'Data'),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child:DefaultFormField(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: startTime,
                                  ).then((value) {
                                    startTimeController.text =
                                        value!.format(context);
                                    startTime = value;
                                    endTime = value;

                                    setState(() {

                                    });
                                  });
                                },
                                hitText: 'Start Time ',
                                validation: (val) {
                                  if (val!.isEmpty) {
                                    return 'Start Time is empty';
                                  } else {
                                    return null;
                                  }
                                }, controller: startTimeController,
                                head: 'Start Time'),
                             ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                            child:DefaultFormField(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime:  endTime,
                                  ).then((value) {
                                    if(value!.hour > startTime.hour) {
                                      if(value.minute > startTime.minute) {
                                        endTimeController.text = value.format(context);
                                      } else {
                                        debugPrint('End time should be greater than start time');
                                      }
                                      endTimeController.text = value.format(context);
                                    } else {
                                      debugPrint('End time should be greater than start time');
                                    }
                                  });
                                },
                                hitText: 'End Time ',
                                validation: (val) {
                                  if (val!.isEmpty) {
                                    return 'End Time is empty';
                                  } else {
                                    return null;
                                  }
                                }, controller: endTimeController,
                                head: 'End Time'),
                     ),
                      ]
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Remind',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Task Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      items: reminderList
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                          key,
                          DropdownMenuItem(
                            value: value.minutes,
                            child: Text(
                              value.reminder,
                            ),
                          ),
                        ),
                      )
                          .values
                          .toList(),
                      onChanged: (value) {
                        debugPrint('$value');
                      },
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                   Container(
                     margin: const EdgeInsets.all(15),
                     width: double.infinity,
                       child: MyButton(onPressed: (){}, text: 'Create Task'))
                  ],
                ),

            ),
          ],
        ),
      );
  },
),
),
    ));
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/reminder_model.dart';
import '../shared/componants/default_form_field.dart';
import '../shared/componants/myButton.dart';
import '../shared/cubit/state.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();

  var dateController = TextEditingController();

  var startTimeController = TextEditingController();

  var endTimeController = TextEditingController();

  TimeOfDay endTime =TimeOfDay.now();

  List<ReminderModel> reminderList = [
    ReminderModel(reminder: '10 minutes', minutes: 10),
    ReminderModel(reminder: '15 minutes', minutes: 15),
    ReminderModel(reminder: '30 minutes', minutes: 30),
    ReminderModel(reminder: '1 hour', minutes: 60),
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
              size: 25,
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
            return  Column(
                children: [
                  const Divider(height: 2, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultFormField(
                            head: 'Title',
                            controller: titleController,
                            hitText: 'Enter Task Title',
                            validation: (val) {
                              if (val!.isEmpty) {
                                return 'Title is empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          DefaultFormField(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2030))
                                  .then((value) {
                                dateController.text =
                                    value.toString().split(' ').first;
                              });
                            },
                            head: 'Date',
                            controller: dateController,
                            hitText: 'Enter Task Date',
                            validation: (val) {
                              if (val!.isEmpty) {
                                return 'Date is empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: DefaultFormField(
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      startTimeController.text =
                                          value!.format(context);
                                      endTime=value;
                                      setState(() {

                                      });
                                    });
                                  },
                                  head: 'Start Time',
                                  controller: startTimeController,
                                  hitText: 'Start Time',
                                  validation: (val) {
                                    if (val!.isEmpty) {
                                      return 'Start  time is empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: DefaultFormField(
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: endTime)
                                        .then((value) {
                                      endTimeController.text =
                                          value!.format(context);
                                    });
                                  },
                                  head: 'End Time',
                                  controller: endTimeController,
                                  hitText: 'End time',
                                  validation: (val) {
                                    if (val!.isEmpty) {
                                      return 'End time is empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'Remaind',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          DropdownButtonFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Remaid',
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  )),
                              items: reminderList
                                  .asMap()
                                  .map(
                                    (key, value) => MapEntry(
                                      key,
                                      DropdownMenuItem(
                                        value: value.minutes,
                                        child: Text(value.reminder),
                                      ),
                                    ),
                                  )
                                  .values
                                  .toList(),
                              onChanged: (value) {
                                debugPrint('$value');
                              })
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: MyButton(text: 'Create Task', onPressed:(){} ,),
                  )
                ],
              );
          },
        ),
      ),
    ));
  }
}

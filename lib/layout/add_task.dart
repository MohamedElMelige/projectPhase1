import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/componants/componants.dart';
import 'package:flutter_application_1/shared/componants/myButton.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../shared/cubit/state.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();

  final remindController = TextEditingController();
  final repeatController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  var startTimeController = TextEditingController();

  var endTimeController = TextEditingController();

  DateTime selectTime = DateTime.now();

  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(Duration(minutes: 15)))
      .toString();

  int selectRemind = 5;

  List<int> remindList = [5, 10, 15, 20];

  String selectRepeat = 'None';

  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  int selectColor = 0;

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
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: Colors.black,
            )),
        title: Text(
          'Add Task',
          style: TextStyle(color: Colors.black, fontSize: 30),
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
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: titleController,
                          type: TextInputType.text,
                          validat: (val) {
                            if (val!.isEmpty) {
                              return 'Title is empty';
                            } else {
                              return null;
                            }
                          },
                          label: 'Design team meeting',
                          prefix: Icons.title),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2021-10-01'))
                                .then((value) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                              print(DateFormat.yMMMd().format(value));
                            });
                          },
                          controller: timeController,
                          type: TextInputType.text,
                          validat: (val) {
                            if (val!.isEmpty) {
                              return 'Date is empty';
                            } else {
                              return null;
                            }
                          },
                          label: DateFormat.yMd().format(selectTime),
                          prefix: Icons.calendar_today_rounded),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Start Time',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                    onTap: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text =
                                            value!.format(context);
                                        print(value.format(context));
                                      });
                                    },
                                    controller: startTimeController,
                                    type: TextInputType.datetime,
                                    validat: (val) {
                                      if (val!.isEmpty) {
                                        return 'Start Time is empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    label: startTime,
                                    prefix: Icons.watch_later_outlined)
                              ],
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'End Time',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                    onTap: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text =
                                            value!.format(context);
                                        print(value.format(context));
                                      });
                                    },
                                    controller: endTimeController,
                                    type: TextInputType.datetime,
                                    validat: (val) {
                                      if (val!.isEmpty) {
                                        return 'End Time is empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    label: endTime,
                                    prefix: Icons.watch_later_outlined)
                              ],
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Remind',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          onTap: () {
                            DropdownButton<dynamic>(
                                dropdownColor: Colors.blueGrey,
                                items: remindList
                                    .map<DropdownMenuItem<String>>((e) =>
                                        DropdownMenuItem(child: Text('$e')))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectRemind = value;
                                  });
                                });
                          },
                          controller: remindController,
                          type: TextInputType.number,
                          validat: (val) {
                            if (val!.isEmpty) {
                              return 'Date is empty';
                            } else {
                              return null;
                            }
                          },
                          label: '$selectRemind minuntes',
                          prefix: Icons.calendar_today_rounded),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Repeat',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          onTap: () {
                            DropdownButton<dynamic>(
                                dropdownColor: Colors.blueGrey,
                                items: repeatList
                                    .map<DropdownMenuItem<String>>((e) =>
                                        DropdownMenuItem(child: Text('$e')))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectRepeat = value;
                                  });
                                });
                          },
                          controller: repeatController,
                          type: TextInputType.number,
                          validat: (val) {
                            if (val!.isEmpty) {
                              return 'Repeat is empty';
                            } else {
                              return null;
                            }
                          },
                          label: '$selectRepeat ',
                          prefix: Icons.calendar_today_rounded),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: double.infinity,
                          child: MyButton(
                              height: 16,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AppCubit.get(context).insertToDatabase(
                                    title: titleController.text,
                                    time: timeController.text,
                                    date: dateController.text,
                                    repeat: repeatController.text,
                                    remind: remindController.text,
                                    endTime: endTimeController.text,
                                    startTime: startTimeController.text,
                                  );
                                }
                              },
                              size: 20,
                              text: 'Create a Task',
                              width: 18))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}

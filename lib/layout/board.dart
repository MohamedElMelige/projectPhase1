import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/done_tasks.dart';
import 'package:flutter_application_1/modules/favorit_task.dart';
import 'package:flutter_application_1/modules/tasks.dart';
import 'package:flutter_application_1/shared/componants/myButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/all_tasks.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';
import 'add_task.dart';
import 'schedule.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Board',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const Schedule(payLoad: 'First|Scand|third')));
                    },
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {

                      setState(() {
                        AppCubit.get(context).changeTheme();
                      });
                    },
                    icon: const Icon(
                        Icons.nightlight_round, color: Colors.black)),
                const Icon(Icons.notifications, size: 30, color: Colors.black)
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                const Divider(height: 2, thickness: 1.5),
                TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black45,
                    indicatorWeight: 3,
                    isScrollable: true,
                    labelColor: Colors.black45,
                    labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 'Completed',
                      ),
                      Tab(
                        text: 'Un Completed',
                      ),
                      Tab(
                        text: 'Favorites',
                      ),
                    ]),
                const Divider(height: 2, thickness: 1.5),
                Expanded(
                  child: TabBarView(
                      controller: _tabController, children: const [
                    Center(child: AllTasks()),
                    Center(child: DoneTasks()),
                    Center(child: Tasks()),
                    Center(child: FavoriteTasks()),
                  ]),
                ),
                Container(
                  width: double.infinity,
                  child: MyButton(
                      color: Colors.green,
                      height: 18,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (
                                context) => const AddTask()));
                      },
                      size: 20,
                      text: 'Add New Task',
                      width: 18),
                )
              ]),
            ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/favorit_task.dart';
import 'package:flutter_application_1/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/all_tasks.dart';
import '../../modules/done_tasks.dart';
import '../../modules/tasks.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> favoriteTasks = [];
  List<Map> allTasks = [];
  late Database database;
  int currentIndex = 0;
  List<Widget> screen = [AllTasks(), Tasks(), DoneTasks(), FavoriteTasks()];
  List<String> appbar = ['All', 'Tasks', 'Done Tasks', 'FavoriteTasks'];
  final key = 'isDarkMode';
  bool togle = false;
  IconData febIcon = Icons.done;

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, verison) async {
      await database.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT , status TEXT,repeat TEXT,remind INTEGER,startTime TEXT,endTime TEXT )');
    }, onOpen: (database) {
      getDatabase(database);
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
    required String repeat,
    required String remind,
    required String startTime,
    required String endTime,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title,date,time,status,repeat,remind,startTime,endTime ) VALUES("$title","$date","$time","new", "$repeat","$remind","$startTime","$endTime")')
          .then((value) {
        print('$value insert successful');
        emit(InsertDatabaseState());
        getDatabase(database);
      }).catchError((error) {
        print('Error is ${error.toString()}');
      });
    });
  }

  void getDatabase(database) async {
    newTasks = [];
    doneTasks = [];
    favoriteTasks = [];

    emit(GetLoadingDatabaseState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          favoriteTasks.add(element);
        }
      });
      emit(GetDatabaseState());
    });
  }

  bool isDark = false;
  void changeThemeState() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }

  void doneTask({required String status, required int id}) async {
    database.rawUpdate(
        'UPDATE tasks SET status=? WHERE id =?', ['$state', id]).then((value) {
      getDatabase(database);
      emit(DoneTaskState());
    });
  }

  void deleteData({required int id}) async {
    database.rawDelete('DELETE FROM tasks WHERE id =?', [id]).then((value) {
      getDatabase(database);
      emit(DeleteDatabaseState());
    });
    void changeIconState({required bool isShow, required IconData icon}) {
      togle = isShow;
      febIcon = icon;
      emit(ChangeIconState());
    }
  }
}

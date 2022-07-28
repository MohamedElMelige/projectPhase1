

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/favorit_task.dart';
import 'package:flutter_application_1/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/done_tasks.dart';
import '../../modules/tasks.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit(): super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> achriveTasks = [];
  late Database database;
  int currentIndex = 0;
  List<Widget> screen = [Tasks(), DoneTasks(), FavoritTasks()];
  List<String> appbar = ['Tasks', 'Done Tasks', 'Archived Tasks'];
  final key= 'isDarkMode';
  bool togle = false;

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, verison) async {
      await database.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT , status TEXT)');
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
  }) async {
    await database.transaction((txn) async{
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")')
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
    newTasks=[];
    doneTasks=[];
    achriveTasks=[];

    emit(GetLoadingDatabaseState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status']=='new') {
          newTasks.add(element);
        }else if(element['status']=='done'){
          doneTasks.add(element);
        }else{
          achriveTasks.add(element);
        }
      });
      emit(GetDatabaseState());
    });
  }
  ThemeMode appMode= ThemeMode.dark;
  void changeThemeState() {
    togle = !togle;
    emit(ChangeThemeState());
  }
  void deleteData({required int id})async{
    database.rawDelete('DELETE FROM tasks WHERE id =?',[id]).then((value) {
      getDatabase(database);
      emit(DeleteDatabaseState());
    });
  }
}
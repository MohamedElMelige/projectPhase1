

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  late Database database;


  void initDatabase() async{
    var databasePath=await getDatabasesPath();
    String path=p.join(databasePath, 'users.db');

        openAppDatabase(path:path, );
    emit(AppDatabaseInitialized());
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE AllTasks (id INTEGER PRIMARY KEY,'
              ' title TEXT,'
              'data TEXT,'
              'startTime TEXT,'
              'endTime TEXT,'
              'reminder INTEGER,'
              'doneTasks INTEGER,'
              'favourite INTEGER,'
              'color INTEGER)',
        );

        debugPrint('Table Created');
      },
      onOpen: (Database db) {
        debugPrint('AppDatabaseOpened');
        database = db;
        getAllTasks();
      },
    );
  }
  void insertTaskData({
  required String title,
  required String startTime,
  required String endTime,
  required String data,
  required int reminder,

}) {

    database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO AllTasks(title,startTime,endTime,color,doneTasks,favourite,data,reminder) VALUES("$title","$startTime","$endTime",$selectColorIndex,0,0,"$data","$reminder")');
    }).then((value) {
      debugPrint('User Data Inserted');
      debugPrint(value.toString());
      getAllTasks();

      emit( InsertDatabaseState());
    });
  }
  List<TaskModel> allTasks=[];
  void getAllTasks() async {
    emit(GetLoadingDatabaseState());
    allTasks=[];

    database.rawQuery('SELECT * FROM AllTasks').then((value) {
      debugPrint('Users Data Fetched');
      for (var element in value) {allTasks.add(TaskModel.fromJson(element)); }


      debugPrint(allTasks.toString());
      emit(GetDatabaseState());
    });
  }

  void updateCompletenceTask(int taskId)async{
    int doneTasks= allTasks.firstWhere((element) => element.id==taskId).doneTasks == 1 ? 0: 1;
   await database.rawUpdate('UPDATE AllTasks SET doneTasks =? WHERE id=$taskId',[doneTasks]).then((value) {
      getAllTasks();
    });

  }


  void updatefavouriteTask(int taskId)async{
    int favourite= allTasks.firstWhere((element) => element.id==taskId).favourite == 1 ? 0: 1;
   await database.rawUpdate('UPDATE AllTasks SET favourite =? WHERE id=$taskId',[favourite]).then((value) {
      getAllTasks();
    });

  }



  List<MaterialColor> color=[
    Colors.red,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
    Colors.blue,
  ];
  int selectColorIndex=0;

  void changeColor(index){
    selectColorIndex=index;
    emit(TaskColorChanged());
  }
  bool isDark=false;
  void changeTheme(){
    isDark = !isDark;
    emit(ChangeThemeState());
  }

}

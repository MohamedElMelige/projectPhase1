import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/board.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AppCubit>(
        create: (context) =>
        AppCubit()
          ..initDatabase(),
      ),
    ], child: BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: false,
              systemOverlayStyle: Platform.isIOS
                  ? null
                  : const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
          darkTheme: ThemeData(),
          themeMode: AppCubit
              .get(context)
              .isDark ? ThemeMode.light : ThemeMode.dark,

          home: Board(),
        );
      },
    ));
  }
}

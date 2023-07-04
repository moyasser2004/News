import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/dio/DioHelper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'control.dart';
import 'cube.dart';
import 'dio/splashScrean.dart';


void main() {

  DioHelper.init();

  runApp(
    BlocProvider(
      create: (BuildContext context) => newCubit()..getBusines(),
      child: BlocConsumer<newCubit, newsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                  size: 25,
                ),
                scrolledUnderElevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.black,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Color(0xff232222),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 25,
                ),
                scrolledUnderElevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.black,
                ),
                backgroundColor: Color(0xff252526),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: newCubit.get(context).bol? ThemeMode.dark:ThemeMode.light,
            home: MyCustomWidget(),
          );
        },
      ),
    ),
  );
}









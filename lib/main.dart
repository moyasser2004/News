import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/view/screen/splash_screen/splashScrean.dart';

import 'controller/cubit/cube.dart';
import 'controller/states/news_states.dart';
import 'core/class/dio/DioHelper.dart';
import 'core/theme/app_theme.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            title: "News App",
            darkTheme: AppTheme.darkTheme,
            themeMode: NewsCubit.get(context).theme
                ? ThemeMode.dark
                : ThemeMode.light,
            home: MyCustomWidget(),
          );
        },
      ),
    );
  }
}

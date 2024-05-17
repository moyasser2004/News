import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/view/widget/home_screen_bottom_nav_bar.dart';

import '../../../controller/cubit/cube.dart';
import '../../../controller/states/news_states.dart';
import '../../widget/home_screen_app_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<NewsCubit, NewsStates>(
        builder: (context, state) {
      NewsCubit controller = NewsCubit.get(context);
      return Scaffold(
        appBar: HomeScreenAppbar(
          onPressed: () {
            controller.isDark();
          },
        ),
        bottomNavigationBar: HomeScreenBottomNavBar(
          screenWidth: screenWidth,
        ),
        body: controller.pages[controller.currentIndex],
      );
    });
  }
}

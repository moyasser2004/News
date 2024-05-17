import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/view/widget/home_screen_list_view.dart';

import '../../../controller/cubit/cube.dart';
import '../../../controller/states/news_states.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        List list = NewsCubit.get(context).sports;
        if (list.length != 0) {
          return HomeScreenListView(list: list);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
      },
    );
  }
}

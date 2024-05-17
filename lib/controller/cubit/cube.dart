import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/class/dio/DioHelper.dart';
import '../../view/screen/home_screen/businec.dart';
import '../../view/screen/home_screen/search.dart';
import '../../view/screen/home_screen/sience.dart';
import '../../view/screen/home_screen/sporst.dart';
import '../states/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(newsInitialStatus());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool theme = false;

  List<IconData> listOfIcons = [
    Icons.business,
    Icons.sports_baseball_outlined,
    Icons.science_outlined,
    Icons.search,
  ];

  List<Widget> pages = [
    Business(),
    Sports(),
    Science(),
    Search1(),
  ];

  void getIndex(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      getBusiness();
    } else if (currentIndex == 1) {
      getSports();
    } else {
      getScience();
    }
    emit(bottomNavigationBar());
  }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> Search = [];

  void getBusiness() {
    emit(businessLoading());
    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        emit(businessSuccess());
        business = value.data['articles'];
      }).catchError((error) {
        emit(businessFail(error.toString()));
        print(error.toString());
      });
    } else {
      emit(businessSuccess());
    }
  }

  void getScience() {
    emit(sinceLoading());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        emit(sinceSuccess());
        science = value.data['articles'];
      }).catchError((error) {
        emit(sinceFail(error.toString()));
      });
    } else {
      emit(sinceSuccess());
    }
  }

  void getSports() {
    emit(sportsLoading());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        emit(sportsSuccess());
        sports = value.data['articles'];
      }).catchError((error) {
        emit(sportsFail(error.toString()));
      });
    } else {
      emit(sportsSuccess());
    }
  }

  void getSearch(String data) {
    Search.clear();
    emit(searchLoading());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': data,
        'apiKey': 'dffe25b50295432a814257e0e968c1bf',
      },
    ).then((value) {
      emit(searchSuccess());
      Search = value.data['articles'];
    }).catchError((error) {
      emit(searchFail(error.toString()));
    });
  }

  isDark() {
    theme = !theme;
    emit(IsDark());
  }
}

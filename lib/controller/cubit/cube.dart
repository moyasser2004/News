import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/businec.dart';
import 'package:news/screens/search.dart';
import 'package:news/screens/sience.dart';
import 'package:news/screens/sporst.dart';

import '../dio/DioHelper.dart';


abstract class newsStates {}
class newsInitialStatus extends newsStates {}


class businessSuccess extends newsStates {}
class sinceSuccess extends newsStates {}
class sportsSuccess extends newsStates {}
class searchSuccess extends newsStates {}


class sinceFail extends newsStates {
  final String error;
  sinceFail(this.error);
}
class businessFail extends newsStates {
  final String error;
  businessFail(this.error);
}
class sportsFail extends newsStates {
  final String error;
  sportsFail(this.error);
}
class searchFail extends newsStates {
  final String error;
  searchFail(this.error);
}

class businessLoading extends newsStates {}
class sinceLoading extends newsStates {}
class sportsLoading extends newsStates {}
class searchLoading extends newsStates {}


class bottomNavigationBar extends newsStates {}
class IsDark extends newsStates {}


class newsCubit extends Cubit<newsStates> {
  newsCubit() : super(newsInitialStatus());

  static newsCubit get(context) => BlocProvider.of(context);

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
    Setting(),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/businec.dart';
import 'package:news/screens/setting.dart';
import 'package:news/screens/sience.dart';
import 'package:news/screens/sporst.dart';
import 'dio/DioHelper.dart';


abstract class newsStates {}

class newsInitialStatus extends newsStates {}

class bottomNavigationBar extends newsStates {}

class businesSucsees extends newsStates{}

class  sinceSucsees extends newsStates{}

class  sportsSucsees extends newsStates{}

class  searchSucesse extends newsStates{}

class sinceFail extends newsStates{
  final String error;
  sinceFail(this.error);
}

class businesFail extends newsStates{
  final String error;
  businesFail(this.error);
}

class sportsFail extends newsStates{
  final String error;
  sportsFail(this.error);
}

class searchfail extends newsStates{
  final String error;
  searchfail(this.error);
}

class businesLoading extends newsStates{}

class sinceLoading extends newsStates{}

class sportsLoading extends newsStates{}

class searchLoding extends newsStates{}


class IsDark extends newsStates {}




class newCubit extends Cubit<newsStates> {
  newCubit() : super(newsInitialStatus());

  static newCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;

  List<IconData> listOfIcons = [
    Icons.business,
    Icons.sports_baseball_outlined,
    Icons.science_outlined,
    Icons.search,
  ];



  void curentIndex(int i) {
    currentIndex = i;

    if(currentIndex==0){
       getBusines();
    }else if(currentIndex==1){
       getSports();
    }else if(currentIndex==2){
       getScience();
    }
    emit(bottomNavigationBar());

  }
  List<dynamic> Busines = [];
  List<dynamic> Science = [];
  List<dynamic> Sports = [];

  void getBusines() {

    emit(businesLoading());

    if(Busines.length==0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },

      ).then((value) {

        emit(businesSucsees());
       Busines  = value.data['articles'];

      }).catchError((error){

        emit(businesFail(error.toString()));

        print(error.toString());
      });

    }else{

      emit(businesSucsees());
    }



  }

  void getScience() {

    emit(sinceLoading());

    if(Science.length==0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },

      ).then((value) {

        emit(sinceSucsees());
        Science = value.data['articles'];
        print(Science[0]['title']);

        emit(sinceSucsees());

      }).catchError((error){

        emit(sinceFail(error.toString()));
        print(error.toString());
      });

    }else{
      emit(sinceSucsees());
    }



  }

  void getSports() {


    emit(sportsLoading());

    if(Sports.length==0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },

      ).then((value) {

        emit(sportsSucsees());
        Sports = value.data['articles'];

      }).catchError((error){

        emit(sportsFail(error.toString()));
        print(error.toString());
      });

    }else{
      emit(sportsSucsees());
    }



  }



 List<Widget> pages=[
   busines(),
    sports(),
   sience(),
   setting(),
 ];

  bool bol=false;

    isDark(){

    bol=!bol;

    emit(IsDark());

  }

  List<dynamic> Search=[];

  void getSearch(String data){
             Search=[];
     emit(searchLoding());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$data',
        'apiKey':'dffe25b50295432a814257e0e968c1bf',
      },

    ).then((value) {

      emit(businesSucsees());
      Search= value.data['articles'];

    }).catchError((error){

      emit(businesFail(error.toString()));

      print(error.toString());
    });
  }



}




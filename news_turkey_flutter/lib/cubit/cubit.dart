import 'package:flutter/material.dart';
import 'package:untitled/cubit/states.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/views/newsflood.dart';
import '../cubit/DioHelper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Business',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
      backgroundColor: Colors.black,
    ),
  ];
  // ignore: non_constant_identifier_names
  List<Widget> Screens = [
    Businessscreen()
  ];

  void changbtn(int index) {
    currentindex = index;
    emit(NewsNavigatorbar());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusinessloading());
    DioHalper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'tr',
        'category': 'business',
        'apiKey': 'f3f6539be8774e8bac3ad9a40e216cff',
      },

      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f3f6539be8774e8bac3ad9a40e216cff
    ).then((value) {
      business = value.data['articles'];
      emit(NewsgetBusiness());
    }).catchError(
      (error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      },
    );
  }

  bool isDark = true;
  // ignore: non_constant_identifier_names
  void Chngtheme() {
    isDark = !isDark;
    emit(ChangeTheme());
  }

  void changebtn(bool isDark) {
    if (isDark == true) {
      icon:
      Icon(Icons.brightness_4_rounded);
    }
    if (isDark == false) {
      icon:
      Icon(Icons.brightness_4_outlined);
    }
    emit(changebutton());
  }
}

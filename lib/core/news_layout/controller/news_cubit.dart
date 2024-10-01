import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_state.dart';
import 'package:group_sun_s1/core/share/network/remote/dio_helper.dart';
import 'package:group_sun_s1/features/modules/news/business/business_screen.dart';
import 'package:group_sun_s1/features/modules/news/science/science_screen.dart';
import 'package:group_sun_s1/features/modules/news/sports/sports_screen.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business_sharp,
        ),
        label: 'New'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_baseball_outlined,
        ),
        label: 'Done'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Archive'),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  List<String> titles = [
    'Business',
    'Sports',
    'Science',
  ];
  int currentIndex = 0;

  var searchController = TextEditingController();

  void changeBottomNav(index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    NewsDioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
        'country': 'us',
        'category': 'business',
      },
    ).then(
      (value) {
        business = value.data['articles'];
        print(value.data['articles']);
        emit(NewsGetBusinessSuccessState());
      },
    ).catchError(
      (error) {
        emit(NewsGetBusinessErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  void getSpots() {
    emit(NewsGetSportsLoadingState());

    NewsDioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
        'country': 'us',
        'category': 'sports',
      },
    ).then(
      (value) {
        sports = value.data['articles'];
        print(value.data['articles']);
        emit(NewsGetSportsSuccessState());
      },
    ).catchError(
      (error) {
        emit(NewsGetSportsErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());

    NewsDioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
        'country': 'us',
        'category': 'science',
      },
    ).then(
      (value) {
        science = value.data['articles'];
        print(value.data['articles']);
        emit(NewsGetScienceSuccessState());
      },
    ).catchError(
      (error) {
        emit(NewsGetScienceErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  void getSearch({required String text}) {
    emit(NewsGetSearchLoadingState());

    NewsDioHelper.getData(
      url: 'v2/everything',
      query: {
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
        'q': text,
      },
    )
        .then(
          (value) {
            search = value.data['articles'];
            emit(NewsGetSearchSuccessState());
          },
        )
        .catchError(
          (error) {
            emit(NewsGetSearchErrorState(error.toString()));
            print(error.toString());
          },
        );
  }
}

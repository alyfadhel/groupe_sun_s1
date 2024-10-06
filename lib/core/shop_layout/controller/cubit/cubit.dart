import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/share/const/const.dart';
import 'package:group_sun_s1/core/share/network/remote/dio_helper.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/state.dart';
import 'package:group_sun_s1/features/modules/shop/categories/presentation/screens/shop_categories_screen.dart';
import 'package:group_sun_s1/features/modules/shop/favorites/data/models/get_favorites.dart';
import 'package:group_sun_s1/features/modules/shop/favorites/presentation/screens/shop_favorite_screen.dart';
import 'package:group_sun_s1/features/modules/shop/home/data/models/categories_model.dart';
import 'package:group_sun_s1/features/modules/shop/home/data/models/change_favorites.dart';
import 'package:group_sun_s1/features/modules/shop/home/data/models/home_model.dart';
import 'package:group_sun_s1/features/modules/shop/home/presentation/screens/shop_home_screen.dart';
import 'package:group_sun_s1/features/modules/shop/settings/presentation/screens/shop_settings_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    const ShopHomeScreen(),
    const ShopCategoriesScreen(),
    const ShopFavoritesScreen(),
    const ShopSettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ];

  int currentIndex = 0;

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopGetHomeLoadingState());
    DioHelper.getData(
      url: homeEndPoint,
      token: token,
    ).then(
      (value) {
        homeModel = HomeModel.fromJson(value.data);
        homeModel!.data.products.forEach(
          (element) {
            favorites.addAll(
              {
                element.id: element.inFavorites,
              },
            );
          },
        );
        print('Home Is: ${value.data.toString()}');
        print('Favorites is ${favorites.toString()}');
        emit(ShopGetHomeSuccessState());
      },
    ).catchError(
      (error) {
        emit(ShopGetHomeErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void getChangeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());
    DioHelper.postData(
      url: changeFavoritesEndPoint,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then(
      (value) {
        changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
        print(value.data.toString());
        if (!changeFavoritesModel!.status) {
          favorites[productId] = !favorites[productId]!;
        }else{
          getFavorites();
        }
        emit(ShopGetChangeFavoritesSuccessState(changeFavoritesModel!));
      },
    ).catchError(
      (error) {
        emit(ShopGetChangeFavoritesErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  GetFavoritesModel? getFavoritesModel;
  void getFavorites() {
    emit(ShopGetFavoritesLoadingState());
    DioHelper.getData(
      url: favoritesEndPoint,
      token: token,
    )
        .then(
          (value) {
            getFavoritesModel = GetFavoritesModel.fromJson(value.data);
            print('Get Favorites is : ${value.data.toString()}');
            emit(ShopGetFavoritesSuccessState());
      },
        )
        .catchError(
          (error) {
            emit(ShopGetFavoritesErrorState(error.toString()));
            print(error.toString());
      },
        );
  }

  CategoriesModel? categoriesModel;

  void getCategoriesHome() {
    emit(ShopGetCategoriesHomeLoadingState());
    DioHelper.getData(
      url: categoriesEndPoint,
    ).then(
      (value) {
        categoriesModel = CategoriesModel.fromJson(value.data);
        print('Categories is: ${value.data.toString()}');
        emit(ShopGetCategoriesHomeSuccessState());
      },
    ).catchError(
      (error) {
        emit(ShopGetCategoriesHomeErrorState(error.toString()));
        print(error.toString());
      },
    );
  }
}

import 'package:group_sun_s1/features/modules/shop/home/data/models/change_favorites.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopGetHomeLoadingState extends ShopStates{}
class ShopGetHomeSuccessState extends ShopStates{}
class ShopGetHomeErrorState extends ShopStates{
  final String error;

  ShopGetHomeErrorState(this.error);
}

class ShopGetCategoriesHomeLoadingState extends ShopStates{}
class ShopGetCategoriesHomeSuccessState extends ShopStates{}
class ShopGetCategoriesHomeErrorState extends ShopStates{
  final String error;

  ShopGetCategoriesHomeErrorState(this.error);
}

class ShopChangeFavoritesState extends ShopStates{}
class ShopGetChangeFavoritesSuccessState extends ShopStates{
  final ChangeFavoritesModel changeFavoritesModel;

  ShopGetChangeFavoritesSuccessState(this.changeFavoritesModel);
}
class ShopGetChangeFavoritesErrorState extends ShopStates{
  final String error;

  ShopGetChangeFavoritesErrorState(this.error);
}

class ShopGetFavoritesLoadingState extends ShopStates{}
class ShopGetFavoritesSuccessState extends ShopStates{}
class ShopGetFavoritesErrorState extends ShopStates{
  final String error;

  ShopGetFavoritesErrorState(this.error);
}
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
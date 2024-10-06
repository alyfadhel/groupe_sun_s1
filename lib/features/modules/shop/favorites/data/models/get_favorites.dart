class GetFavoritesModel {
  final bool status;
  final GetFavoritesDataModel? data;

  GetFavoritesModel({
    required this.status,
    required this.data,
  });

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModel(
      status: json['status'],
      data: json['data'] != null ? GetFavoritesDataModel.fromJson(json['data']) : null,
    );
  }
}

class GetFavoritesDataModel {
  final int currentPage;
  final List<GetFavoritesDetailsDataModel> data;

  GetFavoritesDataModel({
    required this.currentPage,
    required this.data,
  });

  factory GetFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    List<GetFavoritesDetailsDataModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach(
        (element) {
          data.add(GetFavoritesDetailsDataModel.fromJson(element));
        },
      );
    }
    return GetFavoritesDataModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class GetFavoritesDetailsDataModel {
  final int id;
  final GetFavoritesProduct product;

  GetFavoritesDetailsDataModel({
    required this.id,
    required this.product,
  });

  factory GetFavoritesDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesDetailsDataModel(
      id: json['id'],
      product: GetFavoritesProduct.fromJson(json['product']),
    );
  }
}

class GetFavoritesProduct {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  GetFavoritesProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory GetFavoritesProduct.fromJson(Map<String, dynamic> json) {
    return GetFavoritesProduct(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class CategoriesModel {
  final bool status;
  final CategoriesDataModel data;

  CategoriesModel({
    required this.status,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      data: CategoriesDataModel.fromJson(json['data']),
    );
  }
}

class CategoriesDataModel {
  final int currentPage;
  final List<CategoriesDataDetailsModel> data;

  CategoriesDataModel({
    required this.currentPage,
    required this.data,
  });

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    List<CategoriesDataDetailsModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach(
        (element) {
          data.add(CategoriesDataDetailsModel.fromJson(element));
        },
      );
    }
    return CategoriesDataModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class CategoriesDataDetailsModel {
  final int id;
  final String name;
  final String image;

  CategoriesDataDetailsModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoriesDataDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataDetailsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

import 'package:animals_app/models/i_model.dart';

class CategoryModel extends IModel {
  String id;
  String title;
  String image;

  CategoryModel({this.id, this.title, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return CategoryModel.fromJson(json);
  }
}

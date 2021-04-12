import 'package:animals_app/models/i_model.dart';

class AnimalModel extends IModel {
  String title;
  String desc;
  String image;
  int likeCount;
  String category;

  AnimalModel(
      {this.title, this.desc, this.image, this.likeCount, this.category});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
    likeCount = json['likeCount'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['likeCount'] = this.likeCount;
    data['category'] = this.category;
    return data;
  }

  @override
  AnimalModel fromJson(Map<String, dynamic> json) {
    return AnimalModel.fromJson(json);
  }
}

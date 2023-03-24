import 'package:equatable/equatable.dart';
import 'package:news_app/product/utility/base/base_firebase_model.dart';

class News extends Equatable with IdModel, BaseFireBaseModel<News> {

  const News({
    this.category,
    this.categoryId,
    this.title,
    this.backgroundimage,
    this.id,
  });
  @override
  News fromJson(Map<String, dynamic> json) {
    return News(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      backgroundimage: json['backgroundimage'] as String?,
      id: json['id'] as String?,
    );
  }
  final String? category;
  final String? categoryId;
  final String? title;
  final String? backgroundimage;
  @override
  final String? id;

  @override
  List<Object?> get props => [category, categoryId, title, backgroundimage, id];

  News copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? backgroundimage,
    String? id,
  }) {
    return News(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      backgroundimage: backgroundimage ?? this.backgroundimage,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'backgroundimage': backgroundimage,
      'id': id,
    };
  }
  
}

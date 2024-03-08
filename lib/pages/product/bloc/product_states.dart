import 'package:learn_it/common/entities/course.dart';

class ProductState {
  final CourseItem? courseItem;
  const ProductState({this.courseItem});

  ProductState copywith({CourseItem? courseItem}) {
    return ProductState(courseItem: courseItem ?? this.courseItem);
  }
}

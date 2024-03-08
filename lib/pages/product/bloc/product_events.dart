import 'package:learn_it/common/entities/course.dart';

abstract class ProductEvents {
  const ProductEvents();
}

class TriggerProductEvent extends ProductEvents {
  const TriggerProductEvent(this.coursItem) : super();
  final CourseItem coursItem;
}

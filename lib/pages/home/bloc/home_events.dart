import 'package:learn_it/common/entities/course.dart';

abstract class HomeEvent{
 const HomeEvent();
}
class TriggerSlideEvent extends HomeEvent{
  final int index;
  const TriggerSlideEvent(this.index):super();
}

class HomeCourseItemEvent extends HomeEvent{
  final List<CourseItem> courseItem;
  HomeCourseItemEvent(this.courseItem);
}
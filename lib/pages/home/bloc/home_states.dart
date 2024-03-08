import 'package:learn_it/common/entities/course.dart';

class HomeState{
 final int index;
 final List<CourseItem> courseItem;
 const HomeState({this.index=0,
                  this.courseItem=const <CourseItem>[],
                 });

 HomeState copywith({int? index, List<CourseItem>? courseItem})
 {
  return HomeState(index: index??this.index,
                   courseItem: courseItem??this.courseItem,
                   );
 }
}
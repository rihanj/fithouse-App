part of 'home_cubit.dart';

// import 'package:flutter/cupertino.dart';
//
// import '../../../../domain/entity/all_job_entity.dart';
// import '../../../../domain/entity/updated_job_detail_entity.dart';

@immutable
abstract class HomeCreateState {}

class HomeCreateInitial extends HomeCreateState {}
class HomeRefreshState extends HomeCreateState {}
class GetUserState extends HomeCreateState {}
class HomeLoadingState extends HomeCreateState {}


// class GetAllJob extends SchedulingJobsState {
//   List<AllJobEntity> jobs;
//
//   GetAllJob({required this.jobs});
// }



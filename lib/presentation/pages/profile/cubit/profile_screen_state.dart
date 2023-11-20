

part of 'profile_screen_cubit.dart';
@immutable
abstract class ProfileScreenState {}

class ProfileScreenInitialState extends ProfileScreenState {}
class ProfileScreenLoadingState extends ProfileScreenState {}
class RefreshScreenState extends ProfileScreenState {}
class LanguageChange extends ProfileScreenState {
  final Locale local;

  LanguageChange(this.local);
}

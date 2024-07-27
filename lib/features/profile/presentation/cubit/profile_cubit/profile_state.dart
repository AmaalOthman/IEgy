abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class NotificationSwitchedState extends ProfileState {}
final class LogOutLoadingState extends ProfileState {}
final class LogOutSuccessState extends ProfileState {
  final String message;
  LogOutSuccessState(this.message);
}
final class LogOutErrorState extends ProfileState {
  final String message;
  LogOutErrorState(this.message);
}

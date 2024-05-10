class UserState {}

final class UserInitial extends UserState {}

final class LogInSuccess extends UserState {}

final class LogInLoading extends UserState {}

final class LogInFailure extends UserState {
  final String errMessage;

  LogInFailure({required this.errMessage});
}

//====================================================
final class PostSuccess extends UserState {}

final class PostLoading extends UserState {}

final class PostFailure extends UserState {
  final String errMessage;

  PostFailure({required this.errMessage});
}

//==========================================
final class GuidePostSuccess extends UserState {}

final class GuidePostLoading extends UserState {}

final class GuidePostFailure extends UserState {
  final String errMessage;

  GuidePostFailure({required this.errMessage});
}

//===============================================
final class OnePostSuccess extends UserState {}

final class OnePostLoading extends UserState {}

final class OnePostFailure extends UserState {
  final String errMessage;

  OnePostFailure({required this.errMessage});
}

final class OnInfoSuccess extends UserState {}

final class OnInfoLoading extends UserState {}

final class OnInfoFailure extends UserState {
  final String errMessage;

  OnInfoFailure({required this.errMessage});
  //============================================
}

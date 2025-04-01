part of 'authentication_bloc.dart';



sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent { // Perbaikan nama class
  final MyUser? user;

  const AuthenticationUserChanged(this.user);

}

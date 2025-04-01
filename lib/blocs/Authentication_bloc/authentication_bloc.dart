import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;

  AuthenticationBloc({required this.userRepository}) 
      : super(const AuthenticationState.unknown()) {
    
    // Mendengarkan perubahan user dari UserRepository
    _userSubscription = userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });

    // Event handler untuk AuthenticationUserChanged
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != null) {
        if (event.user != null) {
          emit(AuthenticationState.authenticated(event.user!));
        } else {
          emit(const AuthenticationState.unauthenticated());
        }
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel(); // Pastikan untuk membatalkan stream listener
    return super.close();
  }
}

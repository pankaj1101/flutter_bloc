import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc()
      : super(RegistrationInitial(
          showPassword: false,
          showConfirmPassword: false,
          nameController: TextEditingController(),
          emailController: TextEditingController(),
          passWordController: TextEditingController(),
          confirmPasswordController: TextEditingController(),
        )) {
    on<SubmitForm>((event, emit) {});
    on<PasswordToggle>(_passwordToggle);
    on<ConfirmPasswordToggle>(_confirmPasswordToggle);
  }

  FutureOr<void> _passwordToggle(
      PasswordToggle event, Emitter<RegistrationState> emit) {
    final currentState = state as RegistrationInitial;
    emit(currentState.copyWith(showPassword: event.showPassword));
  }

  FutureOr<void> _confirmPasswordToggle(
      ConfirmPasswordToggle event, Emitter<RegistrationState> emit) {
    final currentState = state as RegistrationInitial;
    emit(currentState.copyWith(showConfirmPassword: event.showConfirmPassword));
  }
}

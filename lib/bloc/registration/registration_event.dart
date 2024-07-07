part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class SubmitForm extends RegistrationEvent {}

class PasswordToggle extends RegistrationEvent {
  final bool showPassword;

  const PasswordToggle({required this.showPassword});
  @override
  List<Object> get props => [showPassword];
}

class ConfirmPasswordToggle extends RegistrationEvent {
  final bool showConfirmPassword;

  const ConfirmPasswordToggle({required this.showConfirmPassword});
  @override
  List<Object> get props => [showConfirmPassword];
}

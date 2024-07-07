// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passWordController;
  final TextEditingController confirmPasswordController;

  final bool showPassword;
  final bool showConfirmPassword;

  const RegistrationInitial({
    required this.nameController,
    required this.emailController,
    required this.passWordController,
    required this.confirmPasswordController,
    required this.showPassword,
    required this.showConfirmPassword,
  });

  RegistrationInitial copyWith({
    bool? showPassword,
    bool? showConfirmPassword,
  }) {
    return RegistrationInitial(
      nameController: nameController,
      emailController: emailController,
      passWordController: passWordController,
      confirmPasswordController: confirmPasswordController,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
    );
  }

  @override
  List<Object> get props => [
        nameController,
        emailController,
        passWordController,
        confirmPasswordController
      ];
}

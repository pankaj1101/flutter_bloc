import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/registration/registration_bloc.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Form(
        key: keyForm,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              final currentState = state as RegistrationInitial;
              final isShowPassword = state.showPassword;
              final isShowConfirmPassword = state.showConfirmPassword;

              return Column(
                children: [
                  TextFormField(
                    controller: currentState.nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                    // validator: (value) {},
                  ),
                  TextFormField(
                    controller: currentState.emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    // validator: (value) {},
                  ),
                  TextFormField(
                    controller: currentState.passWordController,
                    obscureText: !isShowPassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<RegistrationBloc>().add(
                                PasswordToggle(
                                  showPassword: !isShowPassword,
                                ),
                              );
                        },
                        icon: Icon(
                          !isShowPassword
                              ? Icons.remove_red_eye
                              : Icons.no_encryption_gmailerrorred_sharp,
                          size: 20,
                        ),
                      ),
                    ),
                    // validator: (value) {},
                  ),
                  TextFormField(
                    controller: currentState.confirmPasswordController,
                    obscureText: !isShowConfirmPassword,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<RegistrationBloc>().add(
                                ConfirmPasswordToggle(
                                  showConfirmPassword: !isShowConfirmPassword,
                                ),
                              );
                        },
                        icon: Icon(
                          !isShowConfirmPassword
                              ? Icons.remove_red_eye
                              : Icons.no_encryption_gmailerrorred_sharp,
                          size: 20,
                        ),
                      ),
                    ),
                    // validator: (value) {},
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        context.read<RegistrationBloc>().add(SubmitForm());
                      },
                      child: const Text('Submit'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled55/cubit/my_app_state.dart';
import 'package:untitled55/user%20inter/homescreen.dart';

import 'package:untitled55/user%20inter/screen/form_screen.dart';

import '../../cubit/my_app_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('email'),
              TextFormField(
                controller: emailC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must be not empty';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('password'),
              TextFormField(
                controller: passwordC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password must be not empty';
                  } else if (value.length < 6) {
                    return 'password must be 6 numbers';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocConsumer<AppCubitA, AppStateA>(
                    listener: (context, state) {
                      if (state is LoginErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.error,
                            ),
                          ),
                        );
                      } else if (state is LoginDoneState) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return const HomeLayout();
                            }));
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            context.read<AppCubitA>().login(
                              emailC.text,
                              passwordC.text,
                            );
                          }
                        },
                        child: state is LoginLoadingState
                            ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                            : const Text('Login'),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const CreateAcc();
                          }));
                    },
                    child: const Text('create account'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

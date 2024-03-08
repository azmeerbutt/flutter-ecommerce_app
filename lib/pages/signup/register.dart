import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/pages/signup/bloc/register_events.dart';
import 'package:learn_it/pages/signup/bloc/register_states.dart';
import 'package:learn_it/pages/signup/register_controller.dart';
import '../../common/widgets/common_widgets.dart';
import 'bloc/register_blocs.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar('Create an account'),
        body: BlocBuilder<RegisterBloc, RegisterStates>(
            builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height.h,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    buildText(text: 'User Name'),
                    const SizedBox(height: 5),
                    buildTextFormField(
                      hint: 'Enter Name',
                      func: () => (value) {
                        context.read<RegisterBloc>().add(UserNameEvent(value));
                      },
                    ),
                    const SizedBox(height: 15),
                    buildText(text: 'Email'),
                    const SizedBox(height: 5),
                    buildTextFormField(
                      hint: 'Enter Email',
                      func: () => (value) {
                        context.read<RegisterBloc>().add(EmailEvent(value));
                      },
                    ),
                    const SizedBox(height: 15),
                    buildText(text: 'Password'),
                    const SizedBox(height: 5),
                    buildTextFormField(
                      hint: 'Enter password',
                      func: () => (value) {
                        context.read<RegisterBloc>().add(PasswordEvent(value));
                      },
                    ),
                    const SizedBox(height: 15),
                    buildText(text: 'Confirm Password'),
                    const SizedBox(height: 5),
                    buildTextFormField(
                      hint: 'Confirm password',
                      func: () => (value) {
                        context
                            .read<RegisterBloc>()
                            .add(RePasswordEvent(value));
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        RegisterController(context: context)
                            .handleRegistration();
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.w),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              )
                            ]),
                        child: Center(
                            child: buildText(
                          text: 'Register',
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildText(
                            text: 'Already have an account? ',
                            color: Colors.grey),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/login', (route) => false);
                            },
                            child: buildText(
                              text: 'Login',
                              color: Colors.blue,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

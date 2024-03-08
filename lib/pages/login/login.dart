import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/pages/login/bloc/login_blocs.dart';
import 'package:learn_it/pages/login/bloc/login_events.dart';
import 'package:learn_it/pages/login/bloc/login_states.dart';
import 'package:learn_it/pages/login/login_controller.dart';
import '../../common/widgets/common_widgets.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar('Login'),
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height.h,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        width: MediaQuery.of(context).size.width.w,
                        height: 70.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildIconButton(
                                iconpath: 'assets/icons/google.png'),
                            buildIconButton(
                                iconpath: 'assets/icons/facebook.png'),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: buildText(
                            text: 'Or use your email to login',
                            color: Colors.grey,
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            buildText(text: 'Email'),
                            const SizedBox(height: 10),
                            buildTextFormField(
                              hint: 'abc@gmail.com',
                              func: () => (value) {
                                context
                                    .read<LoginBloc>()
                                    .add(EmailEvent(value));
                              },
                            ),
                            const SizedBox(height: 10),
                            buildText(text: 'Password'),
                            const SizedBox(height: 10),
                            buildTextFormField(
                              hint: '******',
                              obscureText: true,
                              func: () => (value) {
                                context
                                    .read<LoginBloc>()
                                    .add(PasswordEvent(value));
                              },
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                                onTap: () {},
                                child: buildText(
                                  text: 'Forgot password?',
                                  color: Colors.blue,
                                )),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                LoginController(context: context).handleLogin();
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 50.h, left: 25.w, right: 25.w),
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
                                  text: 'Login',
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
                                  text: 'Does not have an account? ',
                                  color: Colors.grey,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/register', (route) => false);
                                  },
                                  child: buildText(
                                    text: 'Sign up ',
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

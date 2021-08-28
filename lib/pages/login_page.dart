import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_majo/cubit/auth_cubit.dart';
import 'package:testcase_majo/pages/beranda_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.amber,
                  content: Text(state.eror),
                ),
              );
            } else if (state is AuthSuccess) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: GestureDetector(
                onTap: () {
                  context.read<AuthCubit>().signIn();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: 210,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 11),
                        height: 24,
                        width: 24,
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_google.png'))),
                      ),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

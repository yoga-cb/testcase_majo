import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_majo/cubit/auth_cubit.dart';
import 'package:testcase_majo/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {});
    Widget tampilData() {
      return Container(
        child: Column(
          children: [
            Text(user!.displayName.toString()),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(user.photoURL.toString()))),
            )
          ],
        ),
      );
    }

    Widget logoutButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.amber,
              content: Text(state.eror),
            ));
          } else if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
          return Center(
              child: Container(
                  width: 220,
                  height: 55,
                  color: Colors.amber,
                  child: TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().signOut();
                      },
                      child: Text('log Out',
                          style: TextStyle(
                            color: Colors.black,
                          )))));
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthSuccess) {
            return ListView(
              children: [tampilData(), logoutButton()],
            );
          }
          return Container();
        },
      ),
    );
  }
}

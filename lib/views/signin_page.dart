import 'dart:async';

import 'package:demo_work/bloc/GoogleLogin/GoogleLoginBloc.dart';
import 'package:demo_work/utils/color_util.dart';
import 'package:demo_work/views/all_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ColorUtil colorUtil = ColorUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(colorUtil.hexColor("#292c35")),
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 30,
                        color: Color(0xFF666666).withOpacity(.11),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<GoogleLoginBloc>(context)
                          .add(FetchGoogleLogin());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.google),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<GoogleLoginBloc, GoogleLoginState>(
                    bloc: BlocProvider.of<GoogleLoginBloc>(context),
                    builder: (context, loginState) {
                      if (loginState is GoogleLoginInitial) {
                        return Container();
                      } else if (loginState is LoginSuccess) {
                        scheduleMicrotask(() => Navigator.of(context)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => AllMoviePage()),
                                (Route<dynamic> route) => false));
                        return Text(
                          "welcome " + loginState.user.email,
                          style: TextStyle(color: Colors.white),
                        );
                      } else if (loginState is LoginFailed) {
                        return Text("login failed");
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

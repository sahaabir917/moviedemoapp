import 'package:demo_work/bloc/GoogleLogin/GoogleLoginBloc.dart';
import 'package:demo_work/views/all_movie_page.dart';
import 'package:demo_work/views/movie_details.dart';
import 'package:demo_work/views/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GoogleLoginBloc>(
          create: (context) => GoogleLoginBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: isLogin ==false? SignInPage():AllMoviePage(),
        routes: {
          "/all_movie_page" : (context)=> AllMoviePage(),
          "/movie_details" : (context) => MovieDetails(),
        },
      ),
    );
  }

  @override
  void initState() {
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool("isLogin") != null) {
      if (preferences.getBool("isLogin") == true) {
        isLogin = true;
      }
      else{
        isLogin == false;
      }
    }
    else{
      isLogin = false;
    }
  }
}
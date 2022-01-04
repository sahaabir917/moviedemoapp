import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:demo_work/preferencehelper/PreferenceHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'GoogleLoginState.dart';
part 'GoogleLoginEvent.dart';


class GoogleLoginBloc extends Bloc<GoogleLoginEvent,GoogleLoginState>{

  PreferenceHelper preferenceHelper = PreferenceHelper();
  @override
  GoogleLoginState get initialState => GoogleLoginInitial();

  @override
  Stream<GoogleLoginState> mapEventToState(GoogleLoginEvent event) async*{
    if(event is FetchGoogleLogin){
      final googleSignin = GoogleSignIn();
      GoogleSignInAccount _user;

      // GoogleSignInAccount get; user => _user;

        final googleUser = await googleSignin.signIn();

        if(googleUser == null){
          return;
        }
        _user = googleUser;

        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        print(_user);
        if(_user.email.isNotEmpty ||_user.email!=null){
          preferenceHelper.setIsLoggedIn(true);
          yield LoginSuccess(_user);
        }
        else {
          yield LoginFailed();
        }
    }
  }
}
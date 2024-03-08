import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learn_it/common/apis/user_api.dart';
import 'package:learn_it/common/entities/entities.dart';
import 'package:learn_it/global.dart';
import 'package:learn_it/pages/home/home_controller.dart';
import 'package:learn_it/pages/login/bloc/login_blocs.dart';

import '../../common/values/constants.dart';

class LoginController{
 final BuildContext context;
 const LoginController({required this.context});

 Future<void> handleLogin()
 async {
  final state=context.read<LoginBloc>().state;
  String email=state.email;
  String password=state.password;

  if(email.isEmpty)
  {
     ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
     content: Text('email is empty'),
),
);
  }
  if(password.isEmpty)
  {
     ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
     content: Text('password is empty'),
),
);
  }

  try{

    final credential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
   
    if(credential.user==null)
    {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('you does not exist'),
              ),);
    }
     if(credential.user!.emailVerified==false)
    {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('email is not verified yet'),
              ),);
    }
    var user=credential.user;
     if(user!=null)
    {
      String? displayName=user.displayName;
       String? id=user.uid;
        String? email=user.email;
         String? photoUrl=user.photoURL;
     LoginRequestEntity loginRequestEntity=LoginRequestEntity();
     loginRequestEntity.avatar=photoUrl;
     loginRequestEntity.name=displayName;
     loginRequestEntity.email=email;
     loginRequestEntity.open_id=id;
     //type 1 means email login
     loginRequestEntity.type=1;
     asyncPostAllData(loginRequestEntity);
     if(context.mounted){
      await HomeController(context: context).init();
     }
      }


    

  }on FirebaseAuthException catch(e)
  {
      if(e.code=='user-disabled')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('account is disable'),
              ),);

        }else if(e.code=='invalid-email')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('invalid email address'),
              ),);
        }else if(e.code=='user-not-found')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('user is not found'),
              ),);
        }else if(e.code=='wrong-password')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('wrong password'),
              ),);
        }
  }

 }
 
 Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
  EasyLoading.show(
    indicator: const CircularProgressIndicator(),
    maskType: EasyLoadingMaskType.clear,
    dismissOnTap: true,
  );
  var result= await UserAPI.login(params: loginRequestEntity);
  print('token is here :');
  print(result.data!.access_token!);
 if(result.code==200)
 {
  
   try{
       Global.storageServic.setString(AppConstant.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
       Global.storageServic.setString(AppConstant.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
       EasyLoading.dismiss();
       Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
   
  }catch(e){
      EasyLoading.dismiss();
      
  }
 }
 }
}
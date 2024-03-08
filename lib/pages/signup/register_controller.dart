import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/signup/bloc/register_blocs.dart';

class RegisterController{
 final BuildContext context;
 const RegisterController({required this.context});

 Future<void> handleRegistration() async {
  final state=context.read<RegisterBloc>().state;
   String userName=state.userName;
   String email=state.email;
   String password=state.password;
   String rePassword=state.rePassword;

   if(userName.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
     content: Text('user name is empty'),
),
);
   }
   if(email.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
     content: Text('email is empty'),
),
);
   }
   if(password.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
     content: Text('password is empty'),
),
);
   }
   if(rePassword.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
     content: Text('confirm password is empty'),
),
);
   }

   try{

    final credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: password);

      if(credential.user!=null)
      {
       await credential.user?.sendEmailVerification();
       await credential.user?.updateDisplayName(userName);
       String photoUrl="uploads/default.png";
       await credential.user?.updatePhotoURL(photoUrl);
       Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
       ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
       content: Text('an email has been sent to your registerd account, for activation click on the link'),
       ),);
      
      }

   }on FirebaseAuthException catch(e) {
        if(e.code=='email-already-in-use')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('email is already in use'),
              ),);

        }else if(e.code=='invalid-email')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('invalid email address'),
              ),);
        }else if(e.code=='operation-not-allowed')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('operation is not allowed'),
              ),);
        }else if(e.code=='weak-password')
        {
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              content: Text('your password is weak create stronger one'),
              ),);
        }
   }
 }

}
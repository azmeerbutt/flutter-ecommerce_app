class LoginState{
  final String email;
  final String password;
 const LoginState({this.email="",this.password=""});
 LoginState copywith({ String? email, String? password}){
  
  return LoginState(
    email: email??this.email,
    password: password??this.password,
  );
 
 }
}


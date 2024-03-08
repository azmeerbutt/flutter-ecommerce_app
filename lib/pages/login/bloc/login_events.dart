abstract class LoginEvent{
  const LoginEvent();
}
class EmailEvent extends LoginEvent{
  final String email;
 const EmailEvent(this.email);
}
class PasswordEvent extends LoginEvent{
  final String password;
 const PasswordEvent(this.password);
}

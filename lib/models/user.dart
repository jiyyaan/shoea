
class LoginDetail {
  var user;
  var email;
  var pwd;
  LoginDetail({required this.user, required this.email, required this.pwd});
  factory LoginDetail.fromJson(Map<String, dynamic> json) {
    return LoginDetail(
        user: json['username'], email: json['email'], pwd: json['password']);
  }
}
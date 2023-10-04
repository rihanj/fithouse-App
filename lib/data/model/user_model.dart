class UserModel{
  final String name;
  final String email;
  final int mobile;

  UserModel(this.name, this.email, this.mobile);

  Map<String,dynamic> toMap(){
    return {
      "name":name,
      "email":email,
      "mobile":mobile
    };
  }

}


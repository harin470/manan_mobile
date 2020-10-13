class UserModel{
  String uid;
  String email;
  String name;
  String profile_picture;
  UserModel({this.email,this.name,this.profile_picture,this.uid});

  Map toMap(UserModel usermodel){
    var user =Map<String,dynamic>();
    user['email']= usermodel.email;
    user['name'] =usermodel.name;
    user['profile_picture']=usermodel.profile_picture;
    user['uid']=usermodel.uid;
    return user;
    }
  UserModel fromMap(Map map){

    this.email =map['email'];
    this.name= map['name'];
    this.profile_picture= map['profile_picture'];
    this.uid=map['uid'];

  }

  String get getuid{
    return this.uid;
  }
  String get getProfile_picture{
    return this.profile_picture;
  }
  String get getName{
    return this.name;
  }
  String get getemail{
    return this.email;
  }


  }



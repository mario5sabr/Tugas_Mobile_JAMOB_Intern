class UserModel {
  String? uid;
  String? pic;
  String? company;
  String? username;
  String? group;
  String? type;
  String? channels;
  String? password;

  UserModel({
    this.uid,
    this.pic,
    this.company,
    this.username,
    this.group,
    this.type,
    this.channels,
    this.password,
  });

  //data dari server
  factory UserModel.fronMap(map) {
    return UserModel(
      uid: map['uid'],
      pic: map['pic'],
      company: map['company'],
      username: map['username'],
      group: map['group'],
      type: map['type'],
      channels: map['channels'],
      password: map['password'],
    );
  }
}

class UserModel {
  String userID = '';

  String email = '';
  String firstName = '';
  String lastName = '';

  String profilePictureLink = "";

  UserModel({
    required this.email,
    this.userID = '',
    this.firstName = '',
    this.lastName = '',
    this.profilePictureLink = '',
  });
  UserModel.defaultValue() {
    email = '';
    firstName = '';
    lastName = '';

    userID = '';
    profilePictureLink = "";
  }
  UserModel.fromJSon(Map<String, dynamic> json) {
    userID = json['userID'];
    firstName = json['firstName'];
    lastName = json['lastName'];

    email = json['email'];

    profilePictureLink = json['profilePictureLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userID'] = userID;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['profilePictureLink'] = profilePictureLink;
    return data;
  }
}

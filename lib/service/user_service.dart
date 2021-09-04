import 'package:testcase_majo/model/User_model.dart';

class UserService {
  Future<UserModel> getUser(UserModel user) async {
    final String email = user.email;
    final String id = user.id;
    final String name = user.name;
    final String photoUrl = user.photoUrl;

    UserModel akun =
        UserModel(id: id, name: name, email: email, photoUrl: photoUrl);
    return akun;
  }
}

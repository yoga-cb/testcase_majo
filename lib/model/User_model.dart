import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.photoUrl = ''});

  @override
  List<Object> get props => throw [id, name, email, photoUrl];
}

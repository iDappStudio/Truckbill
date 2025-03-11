import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/data/user/datasource/user_data_source.dart';
import 'package:truckbill/domain/user/repository/user.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.userDataSource});

  final UserDataSource userDataSource;

  @override
  Future<User?> getUser() async {
    return userDataSource.getUser();
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    return userDataSource.updateUser(data);
  }

  @override
  Future<bool> checkIfUserExist(String uid) async {
    return userDataSource.checkIfUserExist(uid);
  }
}

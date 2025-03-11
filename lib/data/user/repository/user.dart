import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/data/user/datasource/user_data_source.dart';
import 'package:truckbill/domain/user/repository/user.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);

  final UserDataSource _userDataSource;

  @override
  Future<User> getCurrentUser() async {
    return _userDataSource.getCurrentUser();
  }

  @override
  Future<void> updateUser({String? displayName, String? photoURL}) async {
    return _userDataSource.updateUser(displayName: displayName, photoURL: photoURL);
  }

  @override
  Future<bool> checkIfUserExist(String uid) async {
    return _userDataSource.checkIfUserExist(uid);
  }
}

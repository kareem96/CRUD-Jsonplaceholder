import 'package:crud_jsonplaceholder/src/data/model/user.dart';
import 'package:crud_jsonplaceholder/src/data/services/api_service.dart';

class UserRepo{
  final ApiServices _apiServices = ApiServices();
  static final UserRepo _instance = UserRepo._constructor();

  UserRepo._constructor();
  factory UserRepo(){
    return _instance;
  }

  Future<User> fetchUser(int id) async => _apiServices.fetchUser(id);
}
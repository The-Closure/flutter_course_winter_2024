import 'package:dio/dio.dart';
import 'package:service_layer_clean/model/error_mode.dart';
import 'package:service_layer_clean/model/result_model.dart';
import 'package:service_layer_clean/model/user_model.dart';

abstract class UserService {
  Dio dio = Dio();
  String baseUrl = 'https://jsonplaceholder.typicode.com/users';
  late Response response;

  Future<List<UserModel>> getAllUser();
  Future<ResultModel> getOneUser();
  createUser(UserModel user);
  deleteUser(int id);
}

class UserServiceImpelment extends UserService {
  @override
  createUser(UserModel user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUser() {
    // TODO: implement getAllUser
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> getOneUser() async {
    try {
      response = await dio.get(baseUrl + "/1");

      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromMap(response.data);
        return userModel;
      } else {
        return ErrorModel(message: "Sorry You Don't Have Internet");
      }
    } catch (e) {
      return ErrorModel(message: "Sorry You Don't Have Internet");
    }
  }
}

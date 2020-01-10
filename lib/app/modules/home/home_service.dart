import 'package:dio/dio.dart';
import 'package:testedio/app/models/usermodel.dart';

class HomeService {
  final _client = Dio();

  Future<List<UserModel>> getUsers() async {
    final baseUrl =
        'https://randomuser.me/api/?results=15&nat=br&exc=location,login,registered,id';
    final response = await _client.get(baseUrl);
    return List<UserModel>.from(
      response.data['results'].map(
        (user) => UserModel.fromJson(user),
      ),
    );
  }
}

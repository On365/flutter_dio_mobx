import 'package:mobx/mobx.dart';
import 'package:testedio/app/models/usermodel.dart';
import 'package:testedio/app/modules/home/home_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  
  final service = HomeService();

  @observable
  List<UserModel> data;

  @observable
  bool isLoading = false;

  @action
  Future<void> getData() async {
    data = await service.getUsers();
  }
}

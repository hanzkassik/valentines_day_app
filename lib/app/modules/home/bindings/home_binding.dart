import 'package:get/get.dart';
import 'package:valentines_day/app/data/datasources/love_message_datasource.dart';
import 'package:valentines_day/app/data/interfaces/love_message_datasource_interface.dart';
import 'package:valentines_day/app/data/interfaces/love_message_repositoryinterface.dart';
import 'package:valentines_day/app/data/repositories/love_message_repository.dart';
import 'package:valentines_day/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ILoveMessageDatasource>(LoveMessageDatasource());
    Get.put<ILoveMessageRepository>(
        LoveMessageRepository(datasource: Get.find()));
    Get.put(HomeController());
  }
}

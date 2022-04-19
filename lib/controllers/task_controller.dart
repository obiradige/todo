import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:to_do_app/db/db_helper.dart';
import 'package:to_do_app/models/task.dart';

class TaskController extends GetxController{
  @override
    void onReady(){
      super.onReady();
    }

  Future<int?> addTask({Task? task})async{
    return await DbHelper.insert(task);
  }
}
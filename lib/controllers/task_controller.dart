import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:to_do_app/db/db_helper.dart';
import 'package:to_do_app/models/task.dart';

class TaskController extends GetxController{
  @override
    void onReady(){
      super.onReady();
    }

    var taskList = <Task>[].obs;

  Future<int?> addTask({Task? task})async{
    return await DbHelper.insert(task);
  }
  void getTask()async{
    List<Map<String,dynamic>> tasks = await DbHelper.query();
    taskList.assignAll(tasks.map((data)=> new Task.fromJson(data)).toList());
  }

  void delete(Task task){
    DbHelper.delete(task);
    getTask();
  }

  void markTaskCompleted(int id)async{
    await DbHelper.update(id);
    getTask();
  }
}
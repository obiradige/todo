import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/services/notification_services.dart';
import 'package:to_do_app/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   var notifityHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifityHelper = NotiftyHelper();
    notifityHelper.initializeNotification(); 
    notifityHelper.requestIOSPermissions();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(children: [
        Text(
          "Theme Data",
          style: TextStyle(fontSize: 30),
        )
      ]),
    );
  }

  _appBar(){
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
          notifityHelper.displayNotification(
            title : "furkan",
            body : Get.isDarkMode?"Active dark" : "Active ligth"
          );
          notifityHelper.scheduledNotification();
        },
        child: Icon(Icons.nightlight_round,size: 20,),
      ),
      actions: [
        Icon(Icons.person,size: 20,),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}

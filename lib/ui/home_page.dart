import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/services/notification_services.dart';
import 'package:to_do_app/services/theme_services.dart';
import 'package:to_do_app/constants/themes.dart';
import 'package:to_do_app/ui/add_task_bar.dart';
import 'package:to_do_app/widgets/buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
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
      body: Column(
        children: [
        _addTaskBar(),
        _addDateBar()
      ],)
    );
  }


  _addDateBar(){
    return  Container(
          margin: EdgeInsets.only(left: 20,top: 20),
          child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: Themes.primaryColor,
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w600),),
            dayTextStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
            monthTextStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),),
            onDateChange: (date){
              _selectedDate = date;
            },
          ),
        );
  }
  _addTaskBar(){
     return Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now()), style: Themes().subHeadingStyle,),
                    Text("Today", style: Themes().headingStyle,)
                  ], 
                ),
              ),
              MyButton(label: "+ Add Task", onTap: (){Get.to(AddTaskBar());}),
            ],
          ),
        );
  }

  _appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
          notifityHelper.displayNotification(
            title : "furkan",
            body : Get.isDarkMode?"Active dark" : "Active ligth"
          );
          notifityHelper.scheduledNotification();
        },
        child: Icon(Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,size: 20,color: Get.isDarkMode ? Colors.white : Colors.black,),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/appicon.png"
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}

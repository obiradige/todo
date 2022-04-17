import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constants/themes.dart';
import 'package:to_do_app/widgets/buttons.dart';
import 'package:to_do_app/widgets/input_field.dart';

class AddTaskBar extends StatefulWidget {
  const AddTaskBar({Key? key}) : super(key: key);

  @override
  State<AddTaskBar> createState() => _AddTaskBarState();
}

class _AddTaskBarState extends State<AddTaskBar> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9.30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weakly", "Mont"];
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: Themes().headingStyle,
              ),
              MyInputFile(title: "Title", hint: "Enter your title"),
              MyInputFile(title: "Note", hint: "Enter your note"),
              MyInputFile(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () => _getDateFromUser(),
                  icon: Icon(
                    Icons.calendar_today_outlined,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputFile(
                      title: "Start Date",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: Icon(Icons.access_time_rounded),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MyInputFile(
                      title: "End Date",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Icon(Icons.access_time_rounded),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputFile(
                  title: "Remind",
                  hint: "${_selectedRemind} minutes early",
                  widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 4,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                    style: Themes().subTitleStyle,
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  )),
              MyInputFile(
                  title: "Repeat",
                  hint: "$_selectedRepeat",
                  widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 4,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                    style: Themes().subTitleStyle,
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!),
                      );
                    }).toList(),
                  )),
              SizedBox(
                height: 18,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _colorPallete(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(label: "Create Task", onTap: null),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _colorPallete(){
    return     Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color",
                        style: Themes().titleStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        children: List<Widget>.generate(3, (int index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: index == 0
                                    ? Themes.primaryColor
                                    : index == 1
                                        ? Themes.pinkClr
                                        : Themes.yellowClr,
                                        child: _selectedColor == index?Icon(Icons.done,color: Colors.white,size: 16,):Container(),
                              ),
                              
                            ),
                          );
                        }),
                      )
                    ],
                  );
  }
  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("images/appicon.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2023));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: 9, //int.parse(_startTime.split(":")[0]),
        minute: 10, //int.parse(_startTime.split(":")[1].split(":")[0]),
      ),
    );
  }
}

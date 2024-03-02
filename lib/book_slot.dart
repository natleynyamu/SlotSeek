import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class BookSlotPage extends StatefulWidget {
  const BookSlotPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookSlotPageState createState() => _BookSlotPageState();
}

class _BookSlotPageState extends State<BookSlotPage> {
  DateTime? _selectedDate;
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 1)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text(
              'Book Slot Details',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textLightorange),
            ),
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryGradientStart,
                AppColors.primaryGradientEnd
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Select Date',
                      style: TextStyle(
                          
                          color: AppColors.textDark,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(boxShadow: const [BoxShadow(color: AppColors.greyDark,offset: Offset(0, 2),blurRadius: 2)],
                        color: AppColors.textLightblue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TableCalendar(
                        firstDay: DateTime.now(),
                        lastDay: DateTime.now().add(const Duration(days: 365)),
                        focusedDay: DateTime.now(),
                        calendarFormat: CalendarFormat.month,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDate, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDate = selectedDay;
                          });
                        },
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: AppColors.greyLight, // Grey color for today
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: AppColors
                                .primaryColor, // Blue color for selected date
                            shape: BoxShape.circle,
                          ),
                          weekendTextStyle: TextStyle(
                              color: AppColors
                                  .primaryLight), // Text color for weekends
                        ),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false, // Hide format button
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20), // Month text style
                        ),
                        weekendDays: const [
                          DateTime.sunday,
                          DateTime.saturday
                        ], // Define weekend days
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Selected Date:',
                          style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        _selectedDate != null
                            ? Text(
                                _selectedDate!.toString().substring(0, 10),
                                style: const TextStyle(
                                    color: AppColors.primaryLight, fontSize: 16),
                              )
                            : const Text(
                                'No Date Selected',
                                style: TextStyle(fontSize: 16, color: Colors.red),
                              ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Select Time',
                      style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(decoration: const BoxDecoration(boxShadow: [BoxShadow(color: AppColors.greyDark,blurRadius: 2,offset: Offset(0, 2))]),
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                if (value != null) {
                                  setState(() {
                                    _startTime = value;
                                  });
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.textLightblue),
                            child:  Text(
                              '${_startTime.hour}:${_startTime.minute}',
                              style: const TextStyle(color: AppColors.textDark,),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('to'),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                if (value != null) {
                                  setState(() {
                                    _endTime = value;
                                  });
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.textLightblue),
                            child:  Text(
                              '${_endTime.hour}:${_endTime.minute}',
                              style: const TextStyle(color: AppColors.textDark,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Text(
                          'Amount:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textDark),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '\$10',
                          style: TextStyle(
                              
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryLight),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: PrimaryElevatedButton(
                          text: 'Book',
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
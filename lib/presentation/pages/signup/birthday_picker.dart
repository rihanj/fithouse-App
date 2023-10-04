import 'package:fithouse_app/config/size_config.dart';
import 'package:flutter/material.dart';
import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class BirthdayPicker extends StatefulWidget {
  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: FHColor.appColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: FHColor.appColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FHAppWidget.appBar(context, "FitHouse"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 0.6,
                  minHeight: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(FHColor.appColor),
                  backgroundColor: Colors.grey[200],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'WHEN IS YOUR BIRTHDAY?',
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]
                )
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: FHColor.accentColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedDate != null
                                ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                : 'Select Date of Birth',
                          ),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              // bottom: 16.0, // Adjust the bottom position as needed
              left: 16.0, // Adjust the left position as needed
              right: 16.0, // Adjust the right position as needed
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: SizeConfig.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Button click logic
                      if (_selectedDate != null) {
                        // Do something with _selectedDate
                        Navigator.pushNamed(context, RouteGenerator.genderRoute);
                      }

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: FHColor.appColor,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    child: Text('next'.toUpperCase()),
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}

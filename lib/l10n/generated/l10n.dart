import 'package:flutter/widgets.dart';

class Localization {
  static Localization of(BuildContext context) => Localization();

  String get apply => 'Apply';
  String get cancel => 'Cancel';
  String get ok => 'OK';
  String get close => 'Close';
  String get save => 'Save';
  String get confirm => 'Confirm';
  String get areYouSure => 'Are you sure?';

  String get january => 'January';
  String get february => 'February';
  String get march => 'March';
  String get april => 'April';
  String get may => 'May';
  String get june => 'June';
  String get july => 'July';
  String get august => 'August';
  String get september => 'September';
  String get october => 'October';
  String get november => 'November';
  String get december => 'December';

  String get monday => 'Mon';
  String get tuesday => 'Tue';
  String get wednesday => 'Wed';
  String get thursday => 'Thu';
  String get friday => 'Fri';
  String get saturday => 'Sat';
  String get sunday => 'Sun';

  String get calendar => 'Calendar';
  String get year => 'Year';
  String get month => 'Month';
  String get select => 'Select';

  String get technicalWorkOngoing => 'Technical work is ongoing';
  String get technicalWork => 'Technical work';
  String get errorOccurred => 'An error occurred';
  String get retry => 'Retry';
  String get signOut => 'Sign out';

  String get descriptionAbsent => 'No description';

  String get success => 'Success';
  String get error => 'Error';
  String get warning => 'Warning';
}

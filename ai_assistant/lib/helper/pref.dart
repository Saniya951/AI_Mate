// to use Hive 
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Pref{
  static late Box _box;

  static Future<void> initalize() async {
    // for innitalizing hive to use app directory
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _box = await Hive.openBox('myData');
  }

  // if user uses app fr first time show him onboarding.dart file othervise sent him to home page
  // set getter setter to get boolean val
  static bool get showOnboarding => 
  _box.get('showOnboarding', defaultValue: true);
  static set showOnboarding(bool v) => _box.put('showOnboarding', v);
  
}
import 'package:uuid/uuid.dart';

class MyRandom {
  static String getRandom() {
    var rand = new Uuid().v4();
    return rand;
  }
}

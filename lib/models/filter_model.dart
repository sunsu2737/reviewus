import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  late String state="전체";
  late String presenter="전체";
  late String level="전체";
  late String category="전체";
  late String first="전체";
  late String second="전체";

  selectState(data) {
    state = data;
    notifyListeners();
  }

  selectPresenter(data) {
    presenter = data;
    notifyListeners();
  }

  selectLevel(data) {
    level = data;
    notifyListeners();
  }

  selectCategory(data) {
    category = data;
    notifyListeners();
  }

  selectFirst(data) {
    first = data;
    notifyListeners();
  }

  selectSecond(data) {
    second = data;
    notifyListeners();
  }
}

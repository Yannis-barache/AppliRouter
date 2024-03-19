import 'package:flutter/cupertino.dart';

class loginNotifier extends ChangeNotifier {

  String _username = '';

  bool get loggedIn => _username.isNotEmpty;

  String get username => _username;

  void login(String username) {
    _username = username;
    notifyListeners();
  }

  void logout() {
    _username = '';
    notifyListeners();
  }
}
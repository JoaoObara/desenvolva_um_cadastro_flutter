import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/dummy_users.dart';
import 'package:flutter_application_1/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return;
    }

    // alterar
    // ignore: unnecessary_null_comparison
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      // adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}

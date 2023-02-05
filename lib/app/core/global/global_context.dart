import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class GlobalContext {
  late final GlobalKey<NavigatorState> _navigatorKey;

  static GlobalContext? _instance;

  GlobalContext._();

  static GlobalContext get instance {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  Future<void> loginExpired() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    showTopSnackBar(
      _navigatorKey.currentState!.overlay!,
      const CustomSnackBar.error(
        message: 'Login esperido, clique na sacola novamente.',
      ),
    );

    _navigatorKey.currentState!.popUntil(ModalRoute.withName('/home'));
  }
}

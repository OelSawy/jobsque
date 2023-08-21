import 'dart:developer';

import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();
  static Future<bool> _canAuthenticate() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) {
        return false;
      }
      return await _auth.authenticate(
        authMessages: const [
          AndroidAuthMessages(
            signInTitle: "Log in",
            cancelButton: "No thanks"
          )
        ],
        localizedReason: "Use face id to log in",
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true
        )
      );
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
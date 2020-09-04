import 'dart:io';

Future<bool> checkConnection() async {
  bool state;
  try {
    await InternetAddress.lookup('google.com');
    state = true;
  } catch (e) {
    state = false;
  }
  return state;
}
import '../../../firebase_options.dart';

class ConstsApi {
  static String signUpApiUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${DefaultFirebaseOptions.android.apiKey}';
  static String authenticateApiUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${DefaultFirebaseOptions.android.apiKey}';
}

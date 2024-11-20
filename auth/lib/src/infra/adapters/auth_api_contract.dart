import 'package:auth/src/Domain/credential.dart';
import 'package:async/async.dart';

abstract class IAuthAPi {
  Future<Result<String>> signIn(Credential credential);
  Future<Result<String>> signUp(Credential credential);
}

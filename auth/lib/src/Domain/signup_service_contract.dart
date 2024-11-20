import 'package:auth/src/Domain/tokken.dart';
import 'package:async/async.dart';

abstract class ISignupService {
  Future<Result<Tokken>> signup(String name, String email, String password);
}

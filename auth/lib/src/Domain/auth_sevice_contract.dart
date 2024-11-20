import 'package:auth/src/Domain/tokken.dart';
import 'package:async/async.dart';

abstract class IAuthService {
  Future<Result<Tokken>> signIn();
  Future<void> signOut();
}

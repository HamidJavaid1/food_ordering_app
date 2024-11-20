import 'package:auth/src/Domain/auth_sevice_contract.dart';
import 'package:auth/src/Domain/tokken.dart';
import 'package:async/async.dart';

class SigninUsercase {
  final IAuthService _authService;
  SigninUsercase(this._authService);

  Future<Result<Tokken>> execute() async {
    return await _authService.signIn();
  }
}

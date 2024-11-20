import 'package:auth/src/Domain/signup_service_contract.dart';
import 'package:auth/src/Domain/tokken.dart';
import 'package:async/async.dart';

class SigninUsercase {
  final ISignupService _iSignupService;
  SigninUsercase(this._iSignupService);

  Future<Result<Tokken>> execute(
      String name, String email, String password) async {
    return await _iSignupService.signup(
      name,
      email,
      password,
    );
  }
}

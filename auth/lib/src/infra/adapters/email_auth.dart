import 'package:async/src/result/result.dart';
import 'package:auth/src/Domain/auth_sevice_contract.dart';
import 'package:auth/src/Domain/credential.dart';
import 'package:auth/src/Domain/signup_service_contract.dart';
import 'package:auth/src/Domain/tokken.dart';
import 'package:auth/src/infra/adapters/auth_api_contract.dart';

class EmailAuth implements IAuthService, ISignupService {
  final IAuthAPi _api;
  late Credential _credential;
  EmailAuth(this._api);

  void credential({required String email, required String password}) {
    _credential =
        Credential(type: Authtype.email, email: email, password: password);
  }

  @override
  Future<Result<Tokken>> signIn() async {
    var result = await _api.signIn(_credential);
    if (result.isError) return result.asError!.asError;
    return Result.value(Tokken(result.asValue!.value));
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<Tokken>> signup(
      String name, String email, String password) async {
    Credential credential = Credential(
        type: Authtype.email, name: name, email: email, password: password);
    var result = await _api.signUp(credential);
    if (result.isError) return result.asError!;
    return Result.value(Tokken(result.asValue!.value));
  }
}

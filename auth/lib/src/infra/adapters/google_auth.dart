import 'package:async/src/result/result.dart';
import 'package:auth/src/Domain/auth_sevice_contract.dart';
import 'package:auth/src/Domain/credential.dart';
import 'package:auth/src/Domain/tokken.dart';
import 'package:auth/src/infra/adapters/auth_api_contract.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:async/async.dart';

class GoogleAuth implements IAuthService {
  final IAuthAPi _authAPi;
  final GoogleSignIn _googleSignIn;
  GoogleSignInAccount? _currentUser;

  GoogleAuth(this._authAPi, [GoogleSignIn? googleSignIn])
      : _googleSignIn = googleSignIn ??
            GoogleSignIn(
              scopes: ['email', 'profile'],
            );
  @override
  Future<Result<Tokken>> signIn() async {
    await _handlegoogleSignin();
    if (_currentUser == null)
      return Result.error('Failed to sign in with google');
    Credential credential = Credential(
        type: Authtype.google,
        name: _currentUser!.displayName,
        email: _currentUser!.email);
    var result = await _authAPi.signIn(credential);
    if (result.isError) return result.asError!.asError;
    return Result.value(Tokken(result.asValue!.value));
  }

  @override
  Future<void> signOut() async {
    _googleSignIn.disconnect();
  }

  _handlegoogleSignin() async {
    try {
      _currentUser = await _googleSignIn.signIn();
    } catch (error) {
      return;
    }
  }
}

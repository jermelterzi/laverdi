import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:laverdi/src/domain/user/dtos/credentials.dart';
import 'package:laverdi/src/domain/user/user.dart';
import 'package:laverdi/src/utils/error/auth_exceptions.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class RemoteAuthDataSource {
  AsyncResult<LoggedUser> login(Credentials credentials);
  AsyncResult<Unit> logout();
  AsyncResult<LoggedUser> register(User user, String password);
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final FirebaseAuth _firebaseAuth;

  RemoteAuthDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  AsyncResult<LoggedUser> login(Credentials credentials) async {
    late final UserCredential userCredential;

    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );
    } on FirebaseAuthException catch (e) {
      return Failure(e);
    }

    final user = userCredential.user;

    if (user == null) return Failure(InvalidUserException());

    final loggedUser = LoggedUser(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      token: user.refreshToken ?? '',
    );

    return Success(loggedUser);
  }

  @override
  AsyncResult<Unit> logout() async {
    await _firebaseAuth.signOut();

    return const Success(unit);
  }

  @override
  AsyncResult<LoggedUser> register(User user, String password) async {
    late final UserCredential userCredential;

    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return Failure(e);
    }

    if (userCredential.user == null) return Failure(InvalidUserException());

    await userCredential.user!.updateDisplayName(user.name);

    final loggedUser = LoggedUser(
      id: user.id,
      name: user.name,
      email: user.name,
      token: userCredential.user!.refreshToken ?? '',
    );

    return Success(loggedUser);
  }
}

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/data/models/user_model.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/domain/entities/user_entity.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/domain/repo/auth_repo.dart';
import 'package:dashbaord_sou_okaz/core/Firebase/auth/firebase_auth_service.dart';
import 'package:dashbaord_sou_okaz/core/Firebase/firestore/firestore_service.dart';
import 'package:dashbaord_sou_okaz/core/errors/failure.dart';
import 'package:dashbaord_sou_okaz/core/services/shared_preferences_singleton.dart';
import 'package:dashbaord_sou_okaz/core/utils/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.firestoreService,
  }) : super();
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassworrd(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
        phoneNumber: phoneNumber,
      );
      // ToDo add data to the  database and store it in the shared preferences
      await addUserData(userEntity: userEntity);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      if (user != null) {
        FirebaseAuth.instance.currentUser!.delete();
      }
      return left(FirebaseAuthFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseAuthFailure('error: $e'));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await firestoreService.addData(
      path: 'users',
      data: UserModel.fromEntity(userEntity).toJson(),
      docuid: userEntity.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var data = await firestoreService.getData(path: 'users', docuid: uId);
    return UserModel.fromJson(json: data);
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    String data = jsonEncode(UserModel.fromEntity(userEntity).toJson());
    await SharedPreferencesSingleton.setString(Keys.kSaveUserData, data);
  }

  static UserEntity getUserDataLocallyFromSharedPreferences({
    required String key,
  }) {
    var data = SharedPreferencesSingleton.getString(key);
    return UserModel.fromJson(json: jsonDecode(data));
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ToDo (get data from database --> save data to shared preferences)
      // so I got the data from database and then saved it to shared preferences
      UserEntity userEntity = await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseAuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await firebaseAuthService.resetpassword(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ResetPasswordFailure.fromFirebaseException(e));
    } catch (e) {
      return left(ResetPasswordFailure(e.toString()));
    }
  }
}

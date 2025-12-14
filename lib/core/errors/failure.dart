import 'package:firebase_auth/firebase_auth.dart';

/// Base Failure
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// General server failure
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

/// ===============================
/// Firebase Email & Password Auth
/// ===============================
class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.message);

  factory FirebaseAuthFailure.fromFirebaseException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return FirebaseAuthFailure(
          'The password is too weak.',
        );

      case 'email-already-in-use':
        return FirebaseAuthFailure(
          'This email is already registered.',
        );

      case 'user-not-found':
        return FirebaseAuthFailure(
          'No user found with this email.',
        );

      case 'wrong-password':
        return FirebaseAuthFailure(
          'Wrong password. Please try again.',
        );

      case 'invalid-email':
        return FirebaseAuthFailure(
          'Invalid email address.',
        );

      case 'invalid-credential':
        return FirebaseAuthFailure(
          'Invalid email or password.',
        );

      case 'user-disabled':
        return FirebaseAuthFailure(
          'This user account has been disabled.',
        );

      default:
        return FirebaseAuthFailure(
          'Authentication failed. Please try again.',
        );
    }
  }
}

/// ===============================
/// Google Sign In Failure
/// ===============================
class GoogleSignInFailure extends Failure {
  GoogleSignInFailure(super.message);

  factory GoogleSignInFailure.fromException(Exception e) {
    if (e.toString().toLowerCase().contains('aborted')) {
      return GoogleSignInFailure(
        'Google sign-in was canceled.',
      );
    } else {
      return GoogleSignInFailure(
        'Failed to sign in with Google.',
      );
    }
  }
}

/// ===============================
/// Facebook Auth Failure
/// ===============================
class FacebookAuthFailure extends Failure {
  FacebookAuthFailure(super.message);

  factory FacebookAuthFailure.fromFirebaseException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return FacebookAuthFailure(
          'An account already exists with a different sign-in method.',
        );

      case 'operation-not-allowed':
        return FacebookAuthFailure(
          'Facebook sign-in is not enabled.',
        );

      case 'invalid-credential':
        return FacebookAuthFailure(
          'Invalid Facebook credentials.',
        );

      case 'invalid-verification-code':
      case 'invalid-verification-id':
        return FacebookAuthFailure(
          'Invalid verification code.',
        );

      case 'user-disabled':
        return FacebookAuthFailure(
          'This user account has been disabled.',
        );

      default:
        return FacebookAuthFailure(
          'Facebook sign-in failed.',
        );
    }
  }

  factory FacebookAuthFailure.fromException(Exception e) {
    if (e.toString().toLowerCase().contains('canceled')) {
      return FacebookAuthFailure(
        'Facebook sign-in was canceled.',
      );
    } else {
      return FacebookAuthFailure(
        'Unexpected Facebook sign-in error.',
      );
    }
  }
}

/// ===============================
/// Reset Password Failure
/// ===============================
class ResetPasswordFailure extends Failure {
  ResetPasswordFailure(super.message);

  factory ResetPasswordFailure.fromFirebaseException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return ResetPasswordFailure(
          'No user found with this email.',
        );

      case 'invalid-email':
        return ResetPasswordFailure(
          'Invalid email address.',
        );

      case 'missing-android-pkg-name':
      case 'missing-continue-uri':
      case 'missing-ios-bundle-id':
        return ResetPasswordFailure(
          'Reset link configuration is invalid.',
        );

      case 'invalid-continue-uri':
        return ResetPasswordFailure(
          'Invalid reset password link.',
        );

      case 'unauthorized-continue-uri':
        return ResetPasswordFailure(
          'Unauthorized reset password link.',
        );

      default:
        return ResetPasswordFailure(
          'Failed to send reset password email.',
        );
    }
  }
}

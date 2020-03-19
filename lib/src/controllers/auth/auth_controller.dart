import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/application_controller.dart';
import 'package:hw_4/src/models/user.dart';
import 'package:hw_4/src/services/auth.dart';
import 'package:hw_4/src/constants/auth.dart';

class AuthController extends ApplicationController {
  String email;
  String password;
  String passwordConfirmation;
  bool passwordConfirmed;
  bool authInProgress;
  String _validationErrorMessage;
  ShowMode showMode;
  AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  static final AuthController _authController = AuthController._internal();

  factory AuthController({ StateUpdater setState }) {
    _authController.setState = setState;
    _authController.authInProgress = false;
    _authController.email = '';
    _authController.password = '';
    _authController.passwordConfirmation = '';
    _authController.passwordConfirmed = false;
    _authController.showMode = ShowMode.login;
    _authController._validationErrorMessage = '';

    return _authController;
  }

  AuthController._internal();

  String get showModeLabel {
    if (this.showMode == ShowMode.login) {
      return 'LOGIN';
    }
    if (this.showMode == ShowMode.registration) {
      return 'REGISTER';
    }
    if (this.showMode == ShowMode.forgottenPassword) {
      return 'SEND ME A LETTER';
    }
    return 'ERROR';
  }

  void _handleEmailChange() {
    this.email = this.emailController.text.trim();
  }

  void _handlePasswordChange() {
    this.password = this.passwordController.text.trim();
  }

  void _handlePasswordConfirmationChange() {
    this.passwordConfirmation = this.passwordConfirmationController.text.trim();
  }

  bool _validateEmail() {
    return this.emailController.text.isNotEmpty;
  }

  bool _validatePassword() {
    bool passwordIsValid = this.passwordController.text.isNotEmpty;
    if (this.showMode == ShowMode.login) {
      return passwordIsValid;
    }
    if (this.showMode == ShowMode.registration) {
      return passwordIsValid && this.passwordController.text == this.passwordConfirmationController.text;
    }
    return true;
  }

  void authenticateUser() async {
    if (!this._validateEmail()) return;
    if (!this._validatePassword()) return;

    this._handleEmailChange();
    this._handlePasswordChange();
    this._handlePasswordConfirmationChange();

    this.setState(() {
      this.authInProgress = true;
    });
    User user = this.showMode == ShowMode.login
      ? await this._authService.signInWithEmailAndPassword(email: this.email, password: this.password)
      : await this._authService.signUpWithEmailAndPassword(email: this.email, password: this.password);
    if (user == null) {
      this.setState(() {
        this._validationErrorMessage = this._authService.popError();
        this.authInProgress = false;
      });
    } else {
      this.setState(() {
        this._validationErrorMessage = '';
        this.authInProgress = false;
      });
      this.emailController.clear();
      this.passwordController.clear();
      this.passwordConfirmationController.clear();
    }
  }

  String get validationErrorMessage {
    final String message = this._validationErrorMessage;
    this._validationErrorMessage = '';
    return message;
  }

  bool get validationErrorsPresent {
    return this._validationErrorMessage.isNotEmpty;
  }

  void showLoginForm() {
    super.setState(() {
      this.showMode = ShowMode.login;
    });
  }

  void showRegisterForm() {
    super.setState(() {
      this.showMode = ShowMode.registration;
    });
  }

  void showForgottePasswordForm() {
    super.setState(() {
      this.showMode = ShowMode.forgottenPassword;
    });
  }

  String onEditPassword(String password) {
    super.setState(() {
      if (this.passwordController.text == this.passwordConfirmationController.text) {
        this.passwordConfirmed = true;
      } else {
        this.passwordConfirmed = false;
      }
    });
    return password;
  }
}

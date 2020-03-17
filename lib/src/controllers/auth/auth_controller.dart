import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/application_controller.dart';
import 'package:hw_4/src/models/user.dart';
import 'package:hw_4/src/services/auth.dart';

class AuthController extends ApplicationController {
  String email;
  String password;
  String passwordConfirmation;
  bool passwordConfirmed;
  bool showLogin;
  String validationErrorMessage;
  AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  AuthController({
    StateUpdater setState,
    this.email = '',
    this.password = '',
    this.passwordConfirmation = '',
    this.passwordConfirmed = false,
    this.showLogin = true,
    this.validationErrorMessage = '',
  }): super(setState: setState);

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
    if (this.showLogin) {
      return passwordIsValid;
    } else {
      return passwordIsValid && this.passwordController.text == this.passwordConfirmationController.text;
    }
  }

  void authenticateUser() async {
    if (!this._validateEmail()) return;
    if (!this._validatePassword()) return;

    this._handleEmailChange();
    this._handlePasswordChange();
    this._handlePasswordConfirmationChange();

    User user = this.showLogin
      ? await this._authService.signInWithEmailAndPassword(email: this.email, password: this.password)
      : await this._authService.signUpWithEmailAndPassword(email: this.email, password: this.password);
    if (user == null) {
      this.setState(() {
        this.validationErrorMessage = this._authService.popError();
      });
    } else {
      this.setState(() {
        this.validationErrorMessage = '';
      });
      this.emailController.clear();
      this.passwordController.clear();
      this.passwordConfirmationController.clear();
    }
  }

  void showLoginForm() {
    super.setState(() {
      this.showLogin = true;
    });
  }

  void showRegisterForm() {
    super.setState(() {
      this.showLogin = false;
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

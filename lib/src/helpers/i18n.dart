import 'package:flutter/material.dart';

class I18n {
  BuildContext context;
  Locale myLocale() {
    return Localizations.localeOf(this.context);
  }
}

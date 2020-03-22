# Flutter + Firebase auth

## Setup application

1. Download project: `git clone git@github.com:r72cccp/flutter-test-01.git`;
2. Install dependencies: `flutter pub get`;
3. Check the problems and resolve it's: `flutter doctor`;
4. Go to Firebase console [console.firebase.google.com](console.firebase.google.com) and create the project;
5. Go to Authentication
   1. Enable Email and password auth;
   2. Enable Google auth;
   3. Enable Facebook auth;
   4. Enable Multiple accounts per email address policy restricition - your users can be authorized with several auth types;
6. For email authentication download file `google-services.json` and store it to `./android/app`;
7. Go to Google developer console [https://console.developers.google.com/](https://console.developers.google.com/), create app.
   1. Add `Project public-facing name` and `Project support email` to google auth settings in firebase console;
8. Go to Facebook developer console [https://developers.facebook.com/apps](https://developers.facebook.com/apps), create app.
   1. Add `App ID` and `App secret` to the facebook auth settings in firebase console;
   2. Copy `OAuth redirect URI` from firebase console and paste it to `Valid OAuth Redirect URIs` in facebook console;
   3. Create file `android/app/src/main/res/values/strings.xml`:
  ```xml
  <?xml version="1.0" encoding="utf-8"?>
  <resources>
    <string name="app_name">BSAFit-developement</string>
    <string name="facebook_app_id">FACEBOOK_APP_ID</string>
    <string name="fb_login_protocol_scheme">fbFACEBOOK_APP_ID</string>
  </resources>
  ```
   4. Add fb auth definition code to bottom of <application> block to `android/app/src/main/AndroidManifest.xml`:
  ```xml
    <meta-data
      android:name="com.facebook.sdk.ApplicationId"
      android:value="@string/facebook_app_id"/>

    <activity
      android:name="com.facebook.FacebookActivity"
      android:configChanges="keyboard|keyboardHidden|screenLayout|screenSize|orientation"
      android:label="@string/app_name" />

    <activity
      android:name="com.facebook.CustomTabActivity"
      android:exported="true">
      <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="@string/fb_login_protocol_scheme" />
      </intent-filter>
    </activity>
  ```

## Run application
1. Connect your android device throw ADB console or;
2. Connect your android emulator;
3. Run project with `flutter run`;

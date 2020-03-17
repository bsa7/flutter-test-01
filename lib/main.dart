import 'package:flutter/material.dart';
// import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'src/views/app_view.dart';

void main() => runApp(AppView());
// void main() {
//   FlipperClient flipperClient = FlipperClient.getDefault();

//   flipperClient.addPlugin(new FlipperNetworkPlugin(
//     // If you use http library, you must set it to false and use https://pub.dev/packages/flipperkit_http_interceptor
//     // useHttpOverrides: false,
//     // Optional, for filtering request
//     // filter: (HttpClientRequest request) {
//     //   String url = '${request.uri}';
//     //   if (url.startsWith('https://via.placeholder.com') || url.startsWith('https://gravatar.com')) {
//     //     return false;
//     //   }
//     //   return true;
//     // }
//   ));
//   // flipperClient.addPlugin(new FlipperReduxInspectorPlugin());
//   // flipperClient.addPlugin(new FlipperSharedPreferencesPlugin());
//   flipperClient.start();

//   runApp(AppView());
// }

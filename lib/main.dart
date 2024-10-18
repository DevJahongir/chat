// import 'package:chat_bot/pages/login_page.dart';
// import 'package:chat_bot/pages/register_page.dart';
// import 'package:chat_bot/services/auth/auth_gate.dart';
// import 'package:chat_bot/themes/light_mode.dart';
// import 'package:chat_bot/themes/theme_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: 'AIzaSyCnDkIJbxif-5hRqsoX5AI-GIi2ywzt9ac',
//       appId: '1:262880198575:android:b72c5a0ab597ae5f1af95a',
//       messagingSenderId: '262880198575',
//       projectId: 'chatapptute-bbb67',
//     ),
//   );
//
//
//
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: MyApp(),
//     )
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: AuthGate(),
//       theme: Provider.of<ThemeProvider>(context).themeData,
//       initialRoute: '/',
//       routes: {
//         '/':(context) => AuthGate(),
//       },
//     );
//   }
// }
//

///Local notif added

import 'package:chat_bot/services/auth/auth_gate.dart';
import 'package:chat_bot/services/notifications/notification_service.dart';
import 'package:chat_bot/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCnDkIJbxif-5hRqsoX5AI-GIi2ywzt9ac',
      appId: '1:262880198575:android:b72c5a0ab597ae5f1af95a',
      messagingSenderId: '262880198575',
      projectId: 'chatapptute-bbb67',
    ),
  );


  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthGate(),
      },
    );
  }
}

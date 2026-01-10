import 'package:anopolly/Core/CoreWidgets/splash_screen.dart';
import 'package:anopolly/View/Screens/PollCreation/create_poll_screen.dart';
import 'package:anopolly/View/Screens/PollCreation/create_poll_screen2.dart';
import 'package:anopolly/View/Screens/home_screen.dart';
import 'package:anopolly/ViewModel/poll_provider.dart';
import 'package:anopolly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PollProvider())],
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

      theme: ThemeData(fontFamily: 'poppins'),

      initialRoute: '/splashscreen',

      routes: {
        '/splashscreen': (context) => SplashScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/createpollscreen': (context) => CreatePollScreen(),
      },

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/questionscreen':
            {
              final email = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) => CreatePollScreen2(email: email),
              );
            }

          default:
        }
        return null;
      },
    );
  }
}

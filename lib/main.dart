import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunctexting/common/widgets/error.dart';
import 'package:tunctexting/common/widgets/loader.dart';
import 'package:tunctexting/screens/auth/controller/auth_controller.dart';
import 'package:tunctexting/screens/screens.dart';
import 'package:tunctexting/utils/router.dart';
import 'package:tunctexting/utils/utils.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tunctexting',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: textColor),
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute: (initialRoute) => generateRoute(initialRoute),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileLayoutScreen();
            },
            error: (err, trace) {
              return ErrorScreen(error: err.toString());
            },
            loading: () => const Loader(),
          ),
    );
  }
}

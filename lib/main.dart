import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_downloader/Provider/Download%20Providers/Downloadprovider.dart';
import 'package:video_downloader/Provider/WebView%20Provider/WebviewProvider.dart';
import 'package:video_downloader/Provider/Whatsapp%20Status%20Providers/get_status_provider.dart';
import 'package:video_downloader/Provider/Whatsapp%20Status%20Providers/saved_files_provider.dart';
import 'package:video_downloader/firebase_options.dart';
import 'package:video_downloader/utils/Ad%20Manager/checkinternet.dart';
import 'package:video_downloader/utils/Langauge%20Helper/Languages.dart';
import 'package:video_downloader/utils/Walpaper%20Handler/WalpaperProvider.dart';
import 'package:video_downloader/view/Splash%20Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ConnectivityService.initConnectivity();
  await Permission.storage.request();
  final prefs = await SharedPreferences.getInstance();
  final savedLanguage = prefs.getString('language');
  runApp(MyApp(
    Langauge: savedLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final String? Langauge;
  const MyApp({super.key, this.Langauge});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetStatusProvider()),
        ChangeNotifierProvider(create: (_) => SavedStatusProvider()),
        ChangeNotifierProvider(create: (_) => PhotosProvider()),
        ChangeNotifierProvider(create: (_) => VideoDownloadProvider()),
        ChangeNotifierProvider(create: (_) => WebViewProvider()),
      ],
      child: GetMaterialApp(
          fallbackLocale: const Locale('en,english'),
          translations: Languages(),
          locale: Locale('en', Langauge),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen()),
    );
  }
}

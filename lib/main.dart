import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:super_labs_task/controller/product_controller.dart';
import 'package:super_labs_task/core/constants/color_constants.dart';
import 'package:super_labs_task/core/routes/app_routes.dart';

import 'firebase_options.dart';

// import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        fallbackLocale: const Locale("en", "US"),
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.splash,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: ColorConstants.buttonColor,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:super_labs_task/core/constants/image_constants.dart';
import 'package:super_labs_task/core/routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 5)).then((value) async {
        await Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.dashboard, (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: Image.asset(ImageConstants.logo),
        ),
      ),
    );
  }
}

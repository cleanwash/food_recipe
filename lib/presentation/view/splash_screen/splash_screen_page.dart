import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_recipe/presentation/component/big_button.dart';
import 'package:food_recipe/ui/color_styles.dart';
import 'package:food_recipe/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

// void main() {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cooking App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const SplashScreenPage(),
//     );
//   }
// }

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/icons/splash_screen/splash_screen.png',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66000000),
                  Color(0xFF000000),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 104),
                  Image.asset(
                    'assets/icons/splash_screen/chef_hat.png',
                    width: 79,
                    height: 79,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '100K+ Premium Recipe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 222),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Get\nCooking',
                            textAlign: TextAlign.center,
                            style: TextStyles.titleTextBold.copyWith(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: ColorStyles.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Simple way to find Tasty Recipe',
                            style: TextStyles.normalTextRegular.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorStyles.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(height: 30),
                 
                  SizedBox(
                    child: BigButton(
                      label: 'Start Cooking',
                     path:'/sign_in',
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

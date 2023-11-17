import 'inner_sceen/feeds_screen.dart';
import 'inner_sceen/on_sale_screen.dart';
import 'product/product.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/categories.dart';
import 'screens/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/auth_screen.dart';
import 'auth/auth_manager.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        //ChangeNotifierProvider(create: (context) => CartManager()),
      ],
      child: Consumer<AuthManager>(
        builder: (ctx, authManager, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                //fontFamily: 'Lato',
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.green,
                ).copyWith(
                  secondary: Colors.deepOrange,
                ),
              ),
              home: authManager.isAuth
                  ? const HomeScreen()
                  : FutureBuilder(
                      future: authManager.tryAutoLogin(),
                      builder: (context, snapshot) {
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? const SplashScreen()
                            : const AuthScreen();
                      },
                    ),
              routes: {
                "/home": (ctx) => const HomeScreen(),
                "/categories": (ctx) => CategoriesScreen(),
                "/cart": (ctx) => const CartScreen(),
                OnSaleScreen.routeName: (context) {
                  final arguments = ModalRoute.of(context)!.settings.arguments;
                  if (arguments is List<Product>) {
                    return OnSaleScreen(onSaleProducts: arguments);
                  }
                  return const Scaffold(body: Center(child: Text('Error')));
                },
                FeedsScreen.routeName: (ctx) => const FeedsScreen(),
              });
        },
      ),
    );
  }
}

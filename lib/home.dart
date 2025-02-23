import 'package:flutter/material.dart';

import 'model/product.dart';
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category currentCategory;

  const HomePage({Key? key, required this.currentCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shrine'),
        backgroundColor: kShrinePink100,
      ),
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(currentCategory),
      ),
    );
  }
}

class _ShrineAppState extends State<ShrineApp> {
  final Category _currentCategory = Category.all;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) =>
            HomePage(currentCategory: _currentCategory),
      },
      theme: ThemeData(
        useMaterial3: true,
        textTheme: _buildShrineTextTheme(ThemeData.light().textTheme),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: kShrinePink100,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: CutCornersBorder(),
          focusedBorder: CutCornersBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: kShrineBrown900,
            ),
          ),
          floatingLabelStyle: TextStyle(
            color: kShrineBrown900,
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge?.copyWith(
          fontSize: 18.0,
        ),
        bodySmall: base.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}

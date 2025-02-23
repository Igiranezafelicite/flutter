import 'package:flutter/material.dart';
import 'package:shrine/colors.dart'; // Ensure this contains kShrineBrown900 & kShrinePink100
import 'supplemental/cut_corners_border.dart'; // Ensure this contains CutCornersBorder

enum Category { all, accessories, clothing, home }

// TODO: Add a variable for Category (104)
class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  // TODO: Make currentCategory field take _currentCategory (104)
  final Category _currentCategory = Category.all;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Pass _currentCategory for frontLayer (104)
        '/': (BuildContext context) =>
            HomePage(currentCategory: _currentCategory),
      },
      // TODO: Customize the theme (103)
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

// TODO: Update HomePage to receive currentCategory (104)
class HomePage extends StatelessWidget {
  final Category currentCategory;

  const HomePage({Key? key, required this.currentCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Add app bar (102)
        title: const Text('Shrine'),
        backgroundColor: kShrinePink100,
      ),
      // TODO: Return an AsymmetricView (104)
      body: Center(
        child: Text('Current Category: $currentCategory'),
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

// TODO: Build a Shrine Text Theme (103)
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

import 'package:flutter/material.dart';
import 'package:new_york_times_clone/article.dart';
import 'package:new_york_times_clone/main_screen.dart';
import 'package:new_york_times_clone/view_models/news_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsViewModel())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'New York Times',
        routes: {
          '/': (context) => const MainScreenWindget(),
          '/article': (context) => const ArticleWidget(),
        });
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     // _updateAppbar();
//     super.initState();
//   }

//   void _updateAppbar() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//         systemStatusBarContrastEnforced: true,
//         systemNavigationBarColor: Colors.transparent,
//         systemNavigationBarDividerColor: Colors.transparent,
//         systemNavigationBarIconBrightness: Brightness.dark,
//         statusBarIconBrightness: Brightness.dark));
//   }


// }

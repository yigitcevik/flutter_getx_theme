import 'package:flutter/material.dart';
import 'package:flutter_getx_theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeController themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.getTheme(),
      home: home(),
    );
  }

  Scaffold home() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            themeController.changeTheme();
          });
        },
        child: themeController.isDark()
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
      ),
    );
  }
}

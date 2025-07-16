import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(
    ProviderScope(
      child:
           DevicePreview(builder: (BuildContext context) =>
          const MyApp(),
       ),
    ),
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class Person {
  String name;
  int age;
  String? address;
  Person(this.name, this.age, {this.address});

  Person call({required String address}) {
    log(address);
    return this;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ULearning',
            theme: AppTheme.appthemedata,
            navigatorKey: navKey,
            onGenerateRoute:
                (settings) => AppPages.generalRouteSettings(settings),
          ),
    );
  }
}

final appcount = StateProvider<int>((ref) {
  return 3;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appcount);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Riverpod App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$count', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'one',
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (builder) => Secondpage()));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_alt_rounded),
          ),
          SizedBox(width: 10),

          FloatingActionButton(
            heroTag: 'two',
            onPressed: () {
              ref.read(appcount.notifier).state++;
              log(count.toString());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class Secondpage extends ConsumerWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appcount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$count", style: TextStyle(fontSize: 38))),
    );
  }
}

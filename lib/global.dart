import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/services/storage.dart';
import 'package:ulearning_app/firebase_options.dart';

class Global {
  static late StorageService storageService;

  static Future init()async{
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    storageService = await StorageService().init();
  }
}

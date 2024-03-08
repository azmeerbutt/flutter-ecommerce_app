import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/common/routes/bloc_observer.dart';
import 'package:learn_it/common/services/storage_services.dart';

import 'firebase_options.dart';

class Global {
  static late StorageServic storageServic;
  static Future init() async {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(statusBarColor: Colors.white),
    // );
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageServic = await StorageServic().init();
  }
}

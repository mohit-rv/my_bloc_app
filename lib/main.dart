import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/block_observer.dart';
import 'core/di/service_locator.dart';

void main() async{
  // DI init
  await initDependencies();

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}


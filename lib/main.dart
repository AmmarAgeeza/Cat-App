import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiet_corp_test_task/core/services/service_locator.dart';

import 'app/app.dart';
import 'core/bloc/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  serviceLocatorInit();
  runApp(const MyApp());
}

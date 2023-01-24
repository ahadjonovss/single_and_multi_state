import 'package:bloc_task/app/app.dart';
import 'package:bloc_task/app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_task/utils/my_locale.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  setUp();
  runApp( App());
}





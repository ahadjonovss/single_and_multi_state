import 'package:bloc_task/app/app.dart';
import 'package:bloc_task/app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp( App());
}





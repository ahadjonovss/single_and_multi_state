import 'package:bloc_task/state_managers/bloc/multi_state_bloc/multi_state_bloc.dart';
import 'package:bloc_task/state_managers/bloc/single_state_bloc/single_state_bloc.dart';
import 'package:bloc_task/state_managers/cubit/connectivity/connectivity_cubit.dart';
import 'package:bloc_task/state_managers/cubit/contacts/contacts_cubit.dart';
import 'package:bloc_task/state_managers/cubit/multi_state_cubit/multi_state_cubit.dart';
import 'package:bloc_task/state_managers/cubit/single_state_cubit/single_state_cubit.dart';
import 'package:bloc_task/ui/contants/home_page.dart';
import 'package:bloc_task/ui/tab_box/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephony/telephony.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SingleStateBloc(),),
        BlocProvider(create: (context) => MultiStateBloc(),),
        BlocProvider(create: (context) => SingleStateCubit(),),
        BlocProvider(create: (context) => MultiStateCubit(),),
        BlocProvider(create: (context) => ConnectivityCubit(),),
        BlocProvider(create: (context) => ContactsCubit(),),
      ],
        child: MyApp());
  }
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = "";
  final telephony = Telephony.instance;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
    });
  }

  onSendStatus(SendStatus status) {
    setState(() {
      _message = status == SendStatus.SENT ? "sent" : "delivered";
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Latest received SMS: $_message")),
              TextButton(
                  onPressed: () async {
                    List sms=[
                      "Umring uzoq bo'lsin",
                      "Sog' omon  bo'l",
                      "Sog' omon  bo'l",
                      "Baxtli   bo'l",
                      "Ee tentak ",
                      "Odam   bo'l",
                      "sog' bo'lasan  ",
                      "O'zing avtobusda yurib, Qizingni Yandexga o'tkazish nechpul bo'lyapti, so bolasan ",
                    ];
                    for(int i=0;i<20;i++){
                      await telephony.sendSms(message: sms[i%8],to: "+998995311106",);
                      await Future.delayed(Duration(seconds: 15));
                      print("${sms[i%8]} ketdi");

                    }
                  },
                  child: Text('Sent Dialer'))
            ],
          ),
        ));
  }
}
onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}
import 'package:bloc_larning/screen/api_calling_page.dart';
import 'package:bloc_larning/screen/home_page.dart';
import 'package:bloc_larning/screen/single_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_section/counter-cubit/counter_cubit.dart';
import 'cubit_section/single-profile-cubit/single_profile_cubit.dart';
import 'cubit_section/user-cubit-section/user_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>CounterCubit()),
        BlocProvider(create: (context)=>UserCubit()),
        BlocProvider(create: (context)=>SingleProfileCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(),
          // home: ApiCallingPage()
          home: const SingleProfile(),
      ),
    );
  }
}


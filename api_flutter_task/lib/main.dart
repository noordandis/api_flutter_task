import 'package:api_flutter_task/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/addpost_cubit/addpost_cubit.dart';
import 'cubits/home_cubit/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit()..getAllPost(),
          ),
          BlocProvider(
            create: (context) => AddPostCubit(),
          ),

        ], child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NotoSerif' ),
      home:  HomeScreen(),
    ));
  }
}





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_task/core/di/injection.dart';
import 'package:supabase_flutter_task/features/book/presentation/cubit/book_cubit.dart';
import 'package:supabase_flutter_task/features/author/presentation/cubit/author_cubit.dart';
import 'features/book/presentation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zxdrvsxkbkyglxkqlvho.supabase.co',
    anonKey: 'sb_publishable_xrERU3ksVl4XTFV2kcYaXw_8vTFqUHS',
  );
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthorCubit>()..loadAuthor(),
          ),
          BlocProvider(
            create: (context) => getIt<BookCubit>()..loadBook(),
          ),
        ],
        child: const MainLayoutScreen(),
      ),
    );
  }
}
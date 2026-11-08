import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../constants.dart';
import '../cubit/author_cubit.dart';
import '../widgets/add_author_widget.dart';
import '../widgets/authors_list_widget.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AuthorCubit>()..loadAuthor(),
      child: const _AuthorsScreen(),
    );
  }
}

class _AuthorsScreen extends StatelessWidget {
  const _AuthorsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryNavy,
      appBar: AppBar(
        backgroundColor: primaryNavy,
        elevation: 0,
        title: const Text(
          'إدارة المؤلفين',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: accentYellow),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddAuthorWidget(),
            const SizedBox(height: 20),
            const Row(
              children: [
                SizedBox(width: 180),
                Text(
                  'قائمة المؤلفين المسجلين',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.groups, color: accentYellow),
              ],
            ),
            const SizedBox(height: 10),
            const Expanded(child: AuthorWidget()),
          ],
        ),
      ),
    );
  }
}

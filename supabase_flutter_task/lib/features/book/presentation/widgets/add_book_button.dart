import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../author/presentation/cubit/author_cubit.dart';
import '../../../constants.dart';
import '../cubit/book_cubit.dart';
import 'add_book_dialog_widget.dart';

class AddBookButton extends StatelessWidget {
  const AddBookButton({super.key});

  void _showAddBookDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (dialogContext) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: GetIt.I<AuthorCubit>()..loadAuthor()),

            BlocProvider.value(value: BlocProvider.of<BookCubit>(context)),
          ],

          child: const AddBookDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentYellow,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      onPressed: () => _showAddBookDialog(context),
      icon: const Icon(Icons.add, color: primaryNavy),
      label: const Text(
        'إضافة كتاب',
        style: TextStyle(
          color: primaryNavy,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../author/presentation/cubit/author_cubit.dart';
import '../../../constants.dart';
import '../cubit/book_cubit.dart';

class AddBookDialog extends StatefulWidget {
  const AddBookDialog({super.key});

  @override
  State<AddBookDialog> createState() => _AddBookDialogState();
}

class _AddBookDialogState extends State<AddBookDialog> {
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();
  String? _selectedAuthorId;

  @override
  void initState() {
    super.initState();
    context.read<AuthorCubit>().loadAuthor();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: cardBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '* العنوان',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'أدخل عنوان الكتاب...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: primaryNavy,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              '* سنة النشر',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _yearController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'أدخل سنة النشر...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: primaryNavy,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              '* المؤلف',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            BlocBuilder<AuthorCubit, AuthorState>(
              builder: (context, state) {
                if (state is AuthorLoading) {
                  return const Center(
                    child: LinearProgressIndicator(color: accentYellow),
                  );
                } else if (state is AuthorLoaded) {
                  return DropdownButtonFormField<String>(
                    dropdownColor: primaryNavy,
                    style: const TextStyle(color: Colors.white),
                    initialValue: _selectedAuthorId,
                    hint: const Text(
                      'اختر من القائمة المنسدلة...',
                      style: TextStyle(color: Colors.grey),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: primaryNavy,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    items: state.authorsList.map((author) {
                      return DropdownMenuItem<String>(
                        value: author.id,
                        child: Text(
                          author.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedAuthorId = value;
                      });
                    },
                  );
                }
                return const Text(
                  'تعذر تحميل المؤلفين',
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'إلغاء',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      if (_titleController.text.isNotEmpty &&
                          _yearController.text.isNotEmpty &&
                          _selectedAuthorId != null) {
                        context.read<BookCubit>().addBook(
                          _titleController.text.trim(),
                          int.parse(_yearController.text.trim()),
                          _selectedAuthorId!,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'حفظ',
                      style: TextStyle(
                        color: primaryNavy,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

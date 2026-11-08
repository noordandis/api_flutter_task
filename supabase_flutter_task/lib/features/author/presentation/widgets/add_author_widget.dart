import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../cubit/author_cubit.dart';

class AddAuthorWidget extends StatelessWidget {
  AddAuthorWidget({super.key});
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBg,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF334155), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_add_alt_1, color: accentYellow),
                SizedBox(width: 8),
                Text(
                  'إضافة مؤلف جديد',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '...أدخل اسم المؤلف الكامل',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                fillColor: primaryNavy,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: accentYellow),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 14),
            BlocBuilder<AuthorCubit, AuthorState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentYellow,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: state is AuthorLoading
                      ? null
                      : () {
                          if (_nameController.text.trim().isNotEmpty) {
                            context.read<AuthorCubit>().addAuthor(
                              _nameController.text.trim(),
                            );
                            _nameController.clear();
                          }
                        },
                  child: const Text(
                    '[ + حفظ المؤلف ]',
                    style: TextStyle(
                      color: primaryNavy,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

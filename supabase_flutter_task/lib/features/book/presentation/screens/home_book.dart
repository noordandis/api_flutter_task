import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../widgets/add_book_button.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryNavy,
      appBar: AppBar(
        backgroundColor: primaryNavy,
        elevation: 0,
        title: const Text(
          'مكتبة الكتب',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
            const Row(
              children: [

                SizedBox(width: 200),
                Text(
                  'قائمة الكتب الحالية',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.menu_book, color: accentYellow),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<BookCubit, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: accentYellow),
                    );
                  } else if (state is BookLoaded) {
                    if (state.booksList.isEmpty) {
                      return const Center(
                        child: Text(
                          'لا توجد كتب مضافة حالياً',
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.booksList.length,
                      itemBuilder: (context, index) {
                        final book = state.booksList[index];
                        return _buildBookItem(
                          book.title,
                          book.publishedYear.toString(),
                          book.authorName ?? 'مؤلف غير معروف',
                        );
                      },
                    );
                  } else if (state is BookFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: const AddBookButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBookItem(String title, String year, String author) {
    return Card(
      color: cardBg,
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: accentYellow),
              onPressed: () {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 16,
                      color: accentYellow,
                    ),
                    const SizedBox(width: 4),
                    Text(year, style: const TextStyle(color: Colors.grey)),
                    const Text(' | ', style: TextStyle(color: Colors.grey)),
                    Text(author, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 4),
                    const Icon(Icons.person, size: 16, color: accentYellow),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

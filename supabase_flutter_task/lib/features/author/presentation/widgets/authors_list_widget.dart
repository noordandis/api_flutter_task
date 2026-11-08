import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../cubit/author_cubit.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorCubit, AuthorState>(
      listener: (context, state) {
        if (state is AuthorFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthorLoading) {
          return const Center(
            child: CircularProgressIndicator(color: accentYellow),
          );
        } else if (state is AuthorLoaded) {
          if (state.authorsList.isEmpty) {
            return const Center(
              child: Text(
                'لا يوجد مؤلفين حالياً',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.authorsList.length,
            itemBuilder: (context, index) {
              final author = state.authorsList[index];
              return Card(
                color: cardBg,
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    author.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: accentYellow,
                    child: Icon(Icons.person, color: primaryNavy),
                  ),
                ),
              );
            },
          );
        } else if (state is AuthorFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

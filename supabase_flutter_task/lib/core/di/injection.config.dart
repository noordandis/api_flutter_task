// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase/supabase.dart' as _i590;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/author/data/datasourses/author_remote_data_source.dart'
    as _i390;
import '../../features/author/data/repositories/author_repository_impl.dart'
    as _i964;
import '../../features/author/domain/repositories/author_repositories.dart'
    as _i423;
import '../../features/author/domain/usecases/add_author_usecase.dart' as _i736;
import '../../features/author/domain/usecases/get_author_usecase.dart' as _i707;
import '../../features/author/presentation/cubit/author_cubit.dart' as _i1029;
import '../../features/book/data/datasourses/book_remote_data_source.dart'
    as _i113;
import '../../features/book/data/repositories/book_repository_impl.dart'
    as _i54;
import '../../features/book/domain/repositories/book_repositories.dart' as _i88;
import '../../features/book/domain/usecases/add_book_usecase.dart' as _i874;
import '../../features/book/domain/usecases/get_book_usecase.dart' as _i950;
import '../../features/book/presentation/cubit/book_cubit.dart' as _i320;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.factory<_i390.AuthorRemoteDataSource>(
      () => _i390.AuthorRemoteDataSource(
        supabaseClient: gh<_i590.SupabaseClient>(),
      ),
    );
    gh.factory<_i113.BookRemoteDataSource>(
      () => _i113.BookRemoteDataSource(
        supabaseClient: gh<_i590.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i423.AuthorRepositories>(
      () => _i964.AuthorRepositoryImpl(
        remoteDataSource: gh<_i390.AuthorRemoteDataSource>(),
      ),
    );
    gh.factory<_i736.AddAuthorUseCase>(
      () => _i736.AddAuthorUseCase(repository: gh<_i423.AuthorRepositories>()),
    );
    gh.factory<_i707.GetAuthorUseCase>(
      () => _i707.GetAuthorUseCase(repository: gh<_i423.AuthorRepositories>()),
    );
    gh.factory<_i1029.AuthorCubit>(
      () => _i1029.AuthorCubit(
        getAuthorUseCase: gh<_i707.GetAuthorUseCase>(),
        addAuthorUseCase: gh<_i736.AddAuthorUseCase>(),
      ),
    );
    gh.lazySingleton<_i88.BookRepositories>(
      () => _i54.BookRepositoryImpl(
        remoteDataSource: gh<_i113.BookRemoteDataSource>(),
      ),
    );
    gh.factory<_i874.AddBookUseCase>(
      () => _i874.AddBookUseCase(repository: gh<_i88.BookRepositories>()),
    );
    gh.factory<_i950.GetBookUseCase>(
      () => _i950.GetBookUseCase(repository: gh<_i88.BookRepositories>()),
    );
    gh.factory<_i320.BookCubit>(
      () => _i320.BookCubit(
        getBookUseCase: gh<_i950.GetBookUseCase>(),
        addBookUseCase: gh<_i874.AddBookUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

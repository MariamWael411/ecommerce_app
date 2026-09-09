// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i755;
import '../../features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i46;
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i923;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/ui/login/cubit/login_cubit.dart' as _i416;
import '../../features/auth/ui/register/cubit/register_cubit.dart' as _i539;
import '../../features/network/api/api_client.dart' as _i984;
import '../cache/shared_prefernces/shared_preferences_utils.dart' as _i153;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.lazySingleton<_i153.SharedPreferencesUtils>(
      () => _i153.SharedPreferencesUtils(),
    );
    gh.lazySingleton<_i361.BaseOptions>(() => getItModule.baseOptions);
    gh.lazySingleton<_i528.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.lazySingleton<_i895.Connectivity>(() => getItModule.provideConnectivity);
    gh.lazySingleton<_i984.ApiClient>(() => getItModule.provideApiClient);
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i923.AuthRemoteDataSourceImpl(apiClient: gh<_i984.ApiClient>()),
    );
    gh.factory<_i755.AuthLocalDataSource>(() => _i46.AuthLocalDataSourceImpl());
    gh.factory<_i961.AuthRepository>(
      () => _i409.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i548.AuthRemoteDataSource>(),
        connectivity: gh<_i895.Connectivity>(),
        preferencesUtils: gh<_i153.SharedPreferencesUtils>(),
        authLocalDataSource: gh<_i755.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.lazySingleton<_i1038.LoginUseCase>(
      () => _i1038.LoginUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i539.RegisterCubit>(
      () => _i539.RegisterCubit(registerUseCase: gh<_i1010.RegisterUseCase>()),
    );
    gh.factory<_i416.LoginCubit>(
      () => _i416.LoginCubit(loginUseCase: gh<_i1038.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}

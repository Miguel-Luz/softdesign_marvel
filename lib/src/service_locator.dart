import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:softdesign_marvel/src/data/datasource/comics_datasource.dart';
import 'package:softdesign_marvel/src/data/repository/comic_repository_impl.dart';
import 'package:softdesign_marvel/src/domain/repository/character_repository.dart';
import 'package:softdesign_marvel/src/domain/repository/comic_repository.dart';
import 'package:softdesign_marvel/src/domain/services/build_credential_service.dart';
import 'package:softdesign_marvel/src/external/datasource/characters_datasource_impl.dart';
import 'package:softdesign_marvel/src/external/datasource/comics_datasource_impl.dart';
import 'package:softdesign_marvel/src/external/driver/http_driver.dart';
import 'package:softdesign_marvel/src/external/driver/http_driver_impl.dart';
import 'package:softdesign_marvel/src/data/repository/character_repository_impl.dart';
import 'package:softdesign_marvel/src/data/datasource/characters_datasource.dart';
import 'package:softdesign_marvel/src/data/service/build_credential_service_impl.dart';
import 'package:softdesign_marvel/src/presenter/home/home_store.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator
      .registerSingleton<BuildCredentialService>(BuildCredentialServiceImpl());

  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<HttpDriver>(HttpDriverImpl(locator(), locator()));
  locator.registerLazySingleton<CharactersDatasource>(
      () => CharactersDatasourceImpl(locator()));

  locator.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(locator()));

  locator.registerLazySingleton<ComicDatasource>(
      () => ComicDatasourceImpl(locator()));

  locator.registerLazySingleton<ComicRepository>(
      () => ComicRepositoryImpl(locator()));

  locator.registerLazySingleton<HomeStore>(() => HomeStore());
}

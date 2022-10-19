import 'package:laverdi/src/features/home/data/data_sources/home_local_data_source.dart';
import 'package:laverdi/src/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:laverdi/src/features/home/domain/models/meal.dart';
import 'package:laverdi/src/shared/interfaces/local_data_source.dart';
import 'package:laverdi/src/shared/interfaces/remote_data_source.dart';
import 'package:laverdi/src/shared/interfaces/repository.dart';

class HomeRepository implements Repository {
  final LocalDataSource localDataSource = HomeLocalDataSource();
  final RemoteDataSource remoteDataSource = HomeRemoteDataSource();

  @override
  List<Meal> fetchAll() {
    // final localMeals = localDataSource.meals;

    return [];
  }
}

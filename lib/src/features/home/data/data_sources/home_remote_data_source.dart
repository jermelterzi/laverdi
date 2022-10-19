import 'package:dio/dio.dart';
import 'package:laverdi/src/utils/interfaces/remote_data_source.dart';

class HomeRemoteDataSource implements RemoteDataSource {
  final url = 'https://jsonplaceholder.typicode.com/todos';
  final dio = Dio();
}

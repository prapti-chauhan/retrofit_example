import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_example/repository/model/post.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // var options = BaseOptions(headers: {'contentType ':' application/json'});
  // Dio dio = Dio(options);
  //
  // final ApiClient _instance = ApiClient._privateConstructor(dio, baseUrl: baseUrl);

  @GET('todos/')
  Future<List<Post>> getPosts();
}

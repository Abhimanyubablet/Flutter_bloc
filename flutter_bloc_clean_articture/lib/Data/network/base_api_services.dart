abstract class BaseApiServices{

  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(String url,var data);

  Future<dynamic> delete(String url);

  Future<dynamic> put(String url,var data);


}
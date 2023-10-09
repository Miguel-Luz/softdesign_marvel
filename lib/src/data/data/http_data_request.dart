class HttpDataRequest {
  String baseUrl;
  String? path;
  String? httpMethod;
  dynamic body;
  dynamic queryString;

  HttpDataRequest({
    this.baseUrl = 'https://gateway.marvel.com/v1',
    this.httpMethod = 'GET',
    this.path = '',
    this.queryString = const {},
    this.body,
  });

  String get url => "$baseUrl$path";

  @override
  String toString() => url;
}

class NetworkUtils {
  // Making a class a singleton class
  static NetworkUtils _instance = NetworkUtils.internal();
  NetworkUtils.internal();
  factory NetworkUtils() => _instance;

  Future<dynamic> get() {
    return null;
  }
}

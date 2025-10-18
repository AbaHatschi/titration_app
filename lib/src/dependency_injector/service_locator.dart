class ServiceLocator {
  static final Map<String, dynamic> _services = <String, dynamic>{};

  static void register<T>(String name, T service) {
    _services[name] = service;
  }

  static T get<T>(String name) {
    if (!_services.containsKey(name)) {
      throw Exception('Service $name was not registered!');
    }
    return _services[name] as T;
  }

  static bool has(String name) {
    return _services.containsKey(name);
  }
}

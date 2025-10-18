
/// A simple service locator for dependency injection.
/// This allows registering and retrieving services by name.
class ServiceLocator {
  static final Map<String, dynamic> _services = <String, dynamic>{};

  /// Registers a service with the locator.
  /// [T] is the type of the service.
  /// [name] is the unique name for the service.
  /// [service] is the instance of the service to register.
  /// If a service with the same name already exists, it will be overwritten.
  /// Example:
  /// ```dart
  /// ServiceLocator.register<SomeService>('SomeService', SomeService());
  /// ```
  /// Note: This method does not check for existing registrations.
  static void register<T>(String name, T service) {
    _services[name] = service;
  }

  /// Retrieves a registered service by name.
  /// [T] is the expected type of the service.
  /// [name] is the unique name for the service.

  static T get<T>(String name) {
    if (!_services.containsKey(name)) {
      throw Exception('Service $name was not registered!');
    }
    return _services[name] as T;
  }

  /// Checks if a service is registered with the locator.
  /// [name] is the unique name for the service.
  /// Returns true if the service is registered, false otherwise.
  /// Example:
  /// ```dart
  /// if (ServiceLocator.has('SomeService')) {
  ///   var service = ServiceLocator.get<SomeService>('SomeService');
  /// }
  /// ```
  /// Note: This method only checks for existence, it does not retrieve the service.
  static bool has(String name) {
    return _services.containsKey(name);
  }
}

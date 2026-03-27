class Helper {
  Helper._();

  static bool isEmpty(dynamic value) {
    if (value == null) {
      return true;
    }
    if (value is String || value is List || value is Map) {
      return value.isEmpty;
    }
    return false;
  }

  static bool isNotEmpty(dynamic value) => !isEmpty(value);
}

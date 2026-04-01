import 'sp.dart';

class FroStorage<T> {
  FroStorage({required this.key, this.initialValue});
  final String key;

  final T? initialValue;

  T getItem([T? defaultValue]) {
    return FroSp().getItem(key) ?? defaultValue ?? initialValue;
  }

  Future<void> setItem(T value) async {
    await FroSp().setItem(key, value);
  }

  Future<void> removeItem() async {
    await FroSp().removeItem(key);
  }
}

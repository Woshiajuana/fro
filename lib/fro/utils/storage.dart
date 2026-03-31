import 'sp.dart';

class FroStorage<T> {
  FroStorage({required this.key});
  final String key;

  T getItem([T? defaultValue]) {
    return FroSp().getItem(key) ?? defaultValue;
  }

  Future<void> setItem(T value) async {
    await FroSp().setItem(key, value);
  }

  Future<void> removeItem() async {
    await FroSp().removeItem(key);
  }
}

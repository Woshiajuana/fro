main() {
  // const 定义的变量是编译时常量，final 定义的变量是运行时常量
  const a = 10;
  final b = 20;

  var s = {'x': '1'};

  final fs = s;

  s['x'] = '2';

  print(fs); // {'x': '2'}

  print(0.1 + 0.2); // 0.30000000000000004
  print(0.2.toInt()); // 0

  int i1 = 1;
  double x = i1.toDouble();

  var arr = [1, 2];

  arr.asMap().forEach((index, item) {
    //怎么获取 index
    print(index);
  });

  var v1 = 10 ~/ 3;
  print(v1); // 3

  var add = (int a, {int b = 1, int? c}) {
    return a + b;
  };

  add(1, b: 2, c: 3);
}

main() {
  // const 定义的变量是编译时常量，final 定义的变量是运行时常量
  const a = 10;
  final b = 20;

  var s = {'x': '1'};

  final fs = s;

  s['x'] = '2';

  print(fs); // {'x': '2'}
}

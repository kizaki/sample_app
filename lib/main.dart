import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> titleList = ['Amazon', '楽天', 'Yahoo'];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // widget: 頭が大文字だったらWidget
  // property: 頭が小文字だったらproperty
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワードポスト"),
      ),
      body: ListView.builder(
        itemCount: titleList.length, // 要素数を取得
        itemBuilder: (BuildContext context, int i) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.vpn_key), // 左側に表示
                title: Text(titleList[i]),
              ),
              // 線を表示
              Divider(thickness: 5),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// todo ホーム画面のタイトル変更
// todo リストを表示
// todo リスト間に区切り線を表示
// todo リスト表示を動的に
// todo フローティングアクションボタンをタップ時に、リストを一つ追加表示
// todo 新しい画面をを作成し、リストをタップした時に遷移
// todo 新しい画面のレイアウト作成
// todo 新しい画面にリストからデータを引き継ぐ

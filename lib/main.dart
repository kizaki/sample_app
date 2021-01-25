import 'package:flutter/material.dart';
import 'package:sample_app/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'パスワードリスト',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'パスワードリスト'),
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
              ListTile( // ListTileウィジェット
                onTap: (){
                  // 画面遷移の処理を記述
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => NextPage(titleList[i])));
                },
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
        onPressed: (){
          // ボタンが押された時の処理を記述
          titleList.add('Google');
          //print(titleList);
          setState((){

          });
        }, // 関数に置き換える
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

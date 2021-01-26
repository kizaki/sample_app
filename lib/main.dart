import 'package:flutter/material.dart';
import 'package:sample_app/next_page.dart';

void main() {
  runApp(MyApp()); // ルートウィジェット
}

class MyApp extends StatelessWidget {
  // StatelessWidgetを継承しているため、状態を持たない
  // つまり、一度インスタンスしたら変わることがない
  // 変える必要がある場合は、再度インスタンスをする必要がある
  // StatelessWidgetでは、buildメソッドを実装する必要がある
  @override
  Widget build(BuildContext context) {
    // マテリアルデザインのためのウィジェット
    return MaterialApp(
      title: 'パスワードリスト',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // homeプロパティにアプリケーションが正常に開始されたときの最初に表示されるウィジェットを指定する
      home: MyHomePage(title: 'パスワードリスト'),
    );
  }
}

/* MyHomePageウィジェットは、StatefulWidgetを継承している。
 つまり、変更される可能性のあるデータを持つウィジェットとなる。
 しかし、MyHomePageウィジェットにはそのようなデータが見当たらない。
 さらにStateFullWidgetにはbuild()メソッドっもあったが、代わりに
 createState()メソッドが存在し、このメソッドを実装する必要がある。
 実は、このメソッドでインスタンスして返すのが、状態を保持するStateクラスになる。 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; // 状態が変更される

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// _MyHomePageStateクラスはStateクラスを継承している。つまり状態が変更されるクラスということである。
//
class _MyHomePageState extends State<MyHomePage> {
  List<String> titleList = ['Amazon', '楽天', 'Yahoo'];

  // widget: 頭が大文字だったらWidget
  // property: 頭が小文字だったらproperty
  // buildメソッド => setState()メソッドが呼び出せるたびに呼ばれる
  @override
  Widget build(BuildContext context) {
    // Scaffoldウィジェットは、マテリアルデザイン用のウィジェットである。
    // Scaffoldウィジェットの子孫には必ずMaterialAppウィジェットがいる。
    // ScaffoldウィジェットのプロパティにはappBarなどがあり、簡単にマテリアルデザインの対応ができるようになっている。
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワードポスト"),
      ),
      // Scaffoldウィジェットのbodyプロパティに文字通り画面のボディ部分のウィジェットを記述する。
      body: ListView.builder(
        itemCount: titleList.length, // 要素数を取得
        itemBuilder: (BuildContext context, int i) {
          // Columnウィジェットで縦で並ぶ複数のウィジェットを配置出来るようにする
          return Column(
            children: [
              ListTile(
                // ListTileウィジェット
                onTap: () {
                  // 画面遷移の処理を記述
                  Navigator.push(
                      context,
                      MaterialPageRoute(
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
        onPressed: () {
          // ボタンが押された時の処理を記述
          titleList.add('Google');
          //print(titleList);
          setState(() {}); // 再描画
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

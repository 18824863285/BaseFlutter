import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wan_android_flutter/base/navigator/navigator_helper.dart';
import 'package:wan_android_flutter/business/login/login_page.dart';
import 'base/inject/injector.dart';
import 'generated/l10n.dart';
import 'package:intl_module/generated/l10n.dart' as Smodule;

void main() {
  configInjector();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("adaa"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[getItem("login", LoginPage())],
          ),
        ),
      ),
      localizationsDelegates: const [
        S.delegate,
        Smodule.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('zh', 'CH'), ...S.delegate.supportedLocales],
      locale: const Locale('zh'),
      localeListResolutionCallback: (locales, supportedLocales) {
        print('当前系统语言环境$locales');
        return;
      },
    );
  }

  Widget getItem(String title, page) {
    return Container(
        child: RaisedButton(
            onPressed: () => {NavigatorHelper.push(context, LoginPage())},
            child: Text(title)));
  }
}

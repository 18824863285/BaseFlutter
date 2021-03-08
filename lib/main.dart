import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/retrofit/RestClient.dart';
import 'base/inject/injector.dart';
import 'base/util/preference_utils.dart';
import 'business/start/start_page.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configInjector();
  initRestClient();
  PreferenceUtils.instance.initSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        headerBuilder: () => WaterDropHeader(),
        // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        footerBuilder: () => ClassicFooter(),
        // 配置默认底部指示器
        headerTriggerDistance: 80.0,
        // 头部触发刷新的越界距离
        springDescription:
            SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        // 自定义回弹动画,三个属性值意义请查询flutter api
        maxOverScrollExtent: 100,
        //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        maxUnderScrollExtent: 0,
        // 底部最大可以拖动的范围
        enableScrollWhenRefreshCompleted: true,
        //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
        enableLoadingWhenFailed: true,
        //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: false,
        // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true,
        // 可以通过惯性滑动触发加载更多
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            return locale;
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
            //  visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: StartPage(),
        ));

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   localizationsDelegates: const [
    //     S.delegate,
    //     RefreshLocalizations.delegate,
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     DefaultWidgetsLocalizations.delegate
    //   ],
    //   supportedLocales: S.delegate.supportedLocales,
    //   localeResolutionCallback:
    //       (Locale locale, Iterable<Locale> supportedLocales) {
    //     return locale;
    //   },
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     //  visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: StartPage(),
    // );
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).pageHomeWelcome(Intl.getCurrentLocale()),
            ),
            Text(
              S.of(context).name,
            ),
            //没有context时可用
          ],
        ),
      ),
    );
  }
}

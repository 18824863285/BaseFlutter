import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/base/base_listview_view_model.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/event_bus/event/listview_load_status.dart';
import 'package:wan_android_flutter/base/event_bus/event/listview_request_status.dart';
import 'package:wan_android_flutter/base/event_bus/event_bus.dart';

abstract class BaseListViewState<W extends StatefulWidget,
    VM extends BaseListViewViewModel> extends BaseState<W, VM> {
  bool isInitialRefresh() => true;

  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController(initialRefresh: isInitialRefresh());
  }

  @override
  void initEventBus() {
    super.initEventBus();
    EventBus.instance!.on<ListViewLoadStatus>().listen((event) {
      if (event.status == ListViewLoadStatus.refresh_succ) {
        refreshController.refreshCompleted();
      } else if (event.status == ListViewLoadStatus.load_more_succ) {
        refreshController.loadComplete();
      }
    });

    EventBus.instance!.on<ListViewRequestStatus>().listen((event) {
      if (event.status == ListViewRequestStatus.load_finish) {
        refreshController.loadNoData();
      } else if (event.status == ListViewLoadStatus.load_more_succ) {
        refreshController.loadFailed();
      }
    });
  }

  refresh() {
    viewModel!.refresh();
  }

  loadMore() {
    viewModel!.loadMore();
  }
}

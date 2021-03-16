import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/base/event_bus/event_bus.dart';
import 'event_bus/event/listview_load_status.dart';

abstract class BaseListViewViewModel<T, M> extends BaseViewModel<M> {
  int currIndex = 0;
  int pageSize = 10;

  List<T> dataList;

  void controlResult(List<T> dataList) {
    if (currIndex == 0) {
      this.dataList = dataList;
      EventBus.instance.fire(ListViewLoadStatus());
    } else {
      this.dataList.addAll(dataList);
      EventBus.instance
          .fire(ListViewLoadStatus(status: ListViewLoadStatus.load_more_succ));
    }
    if (dataList.length < pageSize) {
      EventBus.instance.fire(ListViewLoadStatus());
    }
    notifyPage();
  }

  void refresh() {
    currIndex = 0;
    getData();
  }

  void loadMore() {
    currIndex++;
    getData();
  }

  void getData();

}

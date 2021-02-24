
import 'package:flutter/cupertino.dart';

import 'event_bus/event_bus.dart';

// ignore: must_be_immutable
abstract class BaseStatefulWidget extends StatefulWidget {

   String url;

   int index;

   dynamic params;

   BaseStatefulWidget(this.url, this.index, this.params);

   void sendEvent(dynamic event){
      EventBus.instance.fire(event);
   }

}


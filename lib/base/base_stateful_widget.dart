
import 'package:flutter/cupertino.dart';

import 'event_bus/event_bus.dart';
import 'navigator/navigator_mixin.dart';

// ignore: must_be_immutable
abstract class BaseStatefulWidget extends StatefulWidget{

   void sendEvent(dynamic event){
      EventBus.instance!.fire(event);
   }

}


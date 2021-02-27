// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(time) => "剩余${time}S";

  static m1(name) => "language ${name}";

  static m2(param1, param2) => "${param1} , s ${param2}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "age" : MessageLookupByLibrary.simpleMessage("age"),
    "input_login_name" : MessageLookupByLibrary.simpleMessage("请输入登录账号"),
    "input_login_psw" : MessageLookupByLibrary.simpleMessage("请输入登录密码"),
    "leaveTime" : m0,
    "login" : MessageLookupByLibrary.simpleMessage("登录"),
    "loginTitle" : MessageLookupByLibrary.simpleMessage("账号登录"),
    "login_is_not_empty" : MessageLookupByLibrary.simpleMessage("登录账号不可为空"),
    "login_psw_is_not_empty" : MessageLookupByLibrary.simpleMessage("登录密码不可为空"),
    "name" : MessageLookupByLibrary.simpleMessage("name"),
    "pageHomeWelcome" : m1,
    "test" : m2
  };
}

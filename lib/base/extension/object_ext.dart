/// 对象扩展
extension ObjectExt<R, T extends Object> on T {
  //R不要继承自Object，因为void不是Object的子类
  R let(R Function(T t) block) {
    return block(this);
  }

  //  Function() apply(R Function() block) {
  //   return this._callBlock(block);
  // }
  //
  // R Function() _callBlock(R Function() block) {
  //   return block;
  // }

  // R apply1(R Function() block){
  //   return _callBlock( apply(block));
  //   //apply(block);
  // }

}

class A {
  void t() {}
}

class B {
  void testM() {
    A? a;

    a?.let((a) {
      a.t();
    });

    // a?.apply(() {
    //   t();
    // });
  }
}

// extension AllExt<T> on T {
//   void apply(f(T e)) {
//     f(this);
//   }
//
//   R let<R>(R f(T e)) {
//     return f(this);
//   }
// }

// <T, R> T.let(block: (T) -> R): R {
//
// return block(this)
// }

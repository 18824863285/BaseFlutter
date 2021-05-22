/// 对象扩展
extension ObjectExt<R, T extends Object> on T {
  //R不要继承自Object，因为void不是Object的子类
  R let(R Function(T t) block) {
    return block(this);
  }
}



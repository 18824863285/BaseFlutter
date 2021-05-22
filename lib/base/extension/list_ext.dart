extension listExt<T> on List<T> {
  List<T> operator +(List<T> list) {
    this.addAll(list);
    return this;
  }

  List<T> filter(bool Function(T) block) {
    List<T> result = [];
    this.forEach((element) {
      if (block(element)) {
        result.add(element);
      }
    });
    return result;
  }


}

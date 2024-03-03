extension ListExtensions<T> on List<T> {
  List<T> randomise() {
    shuffle();
    return this;
  }
}
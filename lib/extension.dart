extension StringExt on String {
  getUri() {
    return Uri.parse(this);
  }
}

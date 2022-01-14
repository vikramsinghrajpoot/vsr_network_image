extension StringExt on String {
  getUri() {
    return Uri.parse(this);
  }

  String getImageName() {
    return this.split("/").last;
  }
}

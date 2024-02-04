class Util {
  static String createUri(String base, String end) {
    if (!base.endsWith('/')) {
      base += '/';
    }
    if (end.startsWith('/')) {
      end = end.substring(1, end.length);
    }
    return base + end;
  }
}

String trimText(String text, {int maxSize = 15}) {
  if (text.length <= maxSize) {
    return text;
  }
  return '${text.substring(0, maxSize)}....';
}

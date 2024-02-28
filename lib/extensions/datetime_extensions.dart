extension DateTimeExtensions on DateTime {
  String remainingTimeString() {
    Duration difference = this.difference(DateTime.now());

    if (difference.inDays >= 14) {
      return '${difference.inDays ~/ 7} weeks remaining';

    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days remaining';

    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours remaining';

    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes remaining';

    } else {
      return '${difference.inSeconds} seconds remaining';
    }
  }
}
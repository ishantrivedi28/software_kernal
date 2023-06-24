class BadgeCount {
  int count = 0;

  void increaseCount() {
    count++;
  }

  void decreaseCount() {
    if (count > 0) {
      count--;
    }
  }
}

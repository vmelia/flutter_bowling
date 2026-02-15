class Game {
  final List<int> _rolls = List.filled(21, 0);
  int _currentIndex = 0;

  void roll(int pins) => _rolls[_currentIndex++] = pins;

  int score() {
    var firstInFrame = 0;
    var score = 0;

    for (var frame = 0; frame < 10; frame++) {
      if (isStrike(firstInFrame)) {
        score += strikeScore(firstInFrame);
        firstInFrame++;
        continue;
      }

      if (isSpare(firstInFrame)) {
        score += spareScore(firstInFrame);
      } else {
        score += _rolls[firstInFrame] + _rolls[firstInFrame + 1];
      }

      firstInFrame += 2;
    }

    return score;
  }

  bool isStrike(int firstInFrame) => _rolls[firstInFrame] == 10;

  int strikeScore(int firstInFrame) => 10 + _rolls[firstInFrame + 1] + _rolls[firstInFrame + 2];

  bool isSpare(int firstInFrame) => _rolls[firstInFrame] + _rolls[firstInFrame + 1] == 10;

  int spareScore(int firstInFrame) => 10 + _rolls[firstInFrame + 2];
}

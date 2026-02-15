import 'package:flutter_bowling/game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Game game;

  setUp(() {
    game = Game();
  });

  rollMany(int count, int pins) {
    for (var i = 0; i < count; i++) {
      game.roll(pins);
    }
  }

  void rollStrike() {
    game.roll(10);
  }

  void rollSpare() {
    game.roll(6);
    game.roll(4);
  }

  // tests.
  group('game', () {
    test('gutter game', () {
      rollMany(20, 0);

      expect(game.score(), 0);
    });

    test('all ones', () {
      rollMany(20, 1);

      expect(game.score(), 20);
    });

    test('spare in first frame', () {
      rollSpare();
      game.roll(3);
      rollMany(17, 0);

      expect(game.score(), 16);
    });

    test('strike in first frame', () {
      rollStrike();
      game.roll(3);
      game.roll(4);
      rollMany(16, 0);

      expect(game.score(), 24);
    });

    test('spare in last frame', () {
      rollMany(18, 0);
      rollSpare();
      game.roll(3);

      expect(game.score(), 13);
    });

    test('strike in last frame', () {
      rollMany(18, 0);
      rollStrike();
      game.roll(3);
      game.roll(4);

      expect(game.score(), 17);
    });

    test('perfect game', () {
      rollMany(12, 10);

      expect(game.score(), 300);
    });
  });
}

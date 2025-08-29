import 'package:calculatortddassignment/src/addition_tdd_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AdditionTDDController controller;

  setUp(() {
    controller = AdditionTDDController();
  });

  group("1. AddController Tests", () {
    test("1. a) should return 0 when string is empty", () {
      // arrange
      const value = "";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(0));
    });
  });
  test(
    "1. b) should return number itself when input is a single numeric string",
    () {
      // arrange
      const value = "1";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(1));
    },
  );

  test("1. c) should return the sum of two numbers separated by a comma", () {
    // arrange
    const value = "5,2";

    // act
    final result = controller.add(value);

    // assert
    expect(result, equals(7));
  });
}

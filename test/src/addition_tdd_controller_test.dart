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
    const value = "7,1";

    // act
    final result = controller.add(value);

    // assert
    expect(result, equals(8));
  });
  test(
    "1.d) should return correct sum for multiple comma-separated numbers",
    () {
      // arrange
      const value = "4,8,7,4,1";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(24));
    },
  );
  test(
    "2. should return the sum when numbers are separated by commas and new lines",
    () {
      // arrange
      const value = "1\n2,3";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(6));
    },
  );
}

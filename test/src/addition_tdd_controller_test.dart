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
    "2. a) should return the sum when numbers are separated by commas and new lines",
    () {
      // arrange
      const value = "1\n2,3";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(6));
    },
  );
  test(
    "2. b) should handle literal \\n characters between numbers when user input is from the text field",
    () {
      // arrange
      const value = "2\\n3,4";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(9));
    },
  );
  test("3. should return correct sum using a custom delimiter", () {
    // arrange
    const value = "//;\n8;4;1";

    // act
    final result = controller.add(value);

    // assert
    expect(result, equals(13));
  });
  group("4. Negative numbers", () {
    test(
      "4. a) should throw an exception when a negative number is passed in input string",
      () {
        // arrange
        const value = "-3,-4,5,6";

        // act
        action() => controller.add(value);

        // assert
        expect(action, throwsA(isA<Exception>()));
      },
    );
    test(
      "4. b) should throw an exception with message when input string contains negative number",
      () {
        // arrange
        const value = "-3,5";
        const errorMessage = "negative numbers not allowed: -3";

        try {
          // act
          controller.add(value);
        } catch (e) {
          // assert
          expect(e.toString(), contains(errorMessage));
        }
      },
    );
    test(
      "4. c) should throw an exception when multiple negative numbers are present in the input",
      () {
        // arrange
        const value = "-3,-4,3,4";
        const errorMessage = "negative numbers not allowed: -3,-4";

        try {
          // act
          controller.add(value);
        } catch (e) {
          // assert
          expect(e.toString(), contains(errorMessage));
        }
      },
    );
  });
}

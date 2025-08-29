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
}

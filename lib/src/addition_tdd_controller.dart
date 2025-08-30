class AdditionTDDController {
  int add(String inputValue) {
    if (inputValue.isEmpty) {
      return 0;
    }
    if (inputValue.length == 1) {
      return int.parse(inputValue);
    }

    int result = 0;

    String numbersString = inputValue;
    List<String> numbers = [];

    String delimiter = ",";

    // for handling both cases: real newline and escaped "\n"
    if (inputValue.contains(r"\n")) {
      inputValue = inputValue.replaceAll(r"\n", "\n");
    }
    if (inputValue.startsWith("//")) {
      delimiter = inputValue.substring(2, 3);
      numbersString = inputValue.substring(4);
    }

    if (inputValue.contains("\n")) {
      numbersString = numbersString
          .replaceAll(r"\n", ",")
          .replaceAll("\n", ",");
    }

    if (inputValue.contains("\\n")) {
      numbersString = numbersString.replaceAll("\\n", ",");
    }

    numbers = numbersString.split(delimiter);

    final negativeNumbers = <int>[];
    bool hasNegativeNumbers = false;

    for (var number in numbers) {
      final num = int.tryParse(number);
      if (num == null) {
        continue;
      }

      if (num < 0) {
        negativeNumbers.add(num);
        hasNegativeNumbers = true;
      } else if (!hasNegativeNumbers) {
        result += num;
      }
    }

    if (hasNegativeNumbers) {
      final errorMessage =
          "negative numbers not allowed: ${negativeNumbers.join(",")}";
      print(errorMessage);
      throw Exception(errorMessage);
    }

    return result;
  }
}

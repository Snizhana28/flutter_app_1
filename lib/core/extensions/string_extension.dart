extension RemoveLastCharacter on String {
  String removeLastCharacter() {
    if (!isEmpty) {
      final result = substring(0, length - 1);
      if (result.isEmpty) {
        return '0';
      } else {
        return result;
      }
    } else {
      return this;
    }
  }
}

extension NumberModule on String {
  String numberPlusMinus() {
    try {
      final number = num.parse(this);
      return (number * -1).toString();
    } catch (_) {
      return 'Помилка';
    }
  }
}

extension NumberPercent on String {
  String numberPercent() {
    try {
      final number = num.parse(this);
      return (number / 100).toString();
    } catch (_) {
      return 'Помилка';
    }
  }
}

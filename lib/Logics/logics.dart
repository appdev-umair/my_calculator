import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../Widgets/ScreenWidget.dart';

late String _textBeforeCursor;
late String _textAfterCursor;
int _cursorPosition = ScreenWidget.expression.value.selection.baseOffset;

class Button {
  Future<void> number(String number) async {
    if (ScreenWidget.expression.value.text.isEmpty) {
      ScreenWidget.expression.value.text = number;
    } else {
      _textBeforeCursor = ScreenWidget.expression.value.text
          .substring(0, ScreenWidget.expression.value.selection.baseOffset);
      String textAfterCursor = ScreenWidget.expression.value.text
          .substring(ScreenWidget.expression.value.selection.extentOffset);
      ScreenWidget.expression.value.text =
          _textBeforeCursor + number + textAfterCursor;
      _cursorPosition = _textBeforeCursor.length + 1;
      ScreenWidget.expression.value.selection =
          TextSelection.collapsed(offset: _cursorPosition);
    }
    _scroller();

    setAnswer(ScreenWidget.expression.value.text);
  }

  Future<void> operation(String symbol) async {
    if (symbol == "–") {
      if (ScreenWidget.expression.value.text.isEmpty) {
        ScreenWidget.expression.value.text = "–";
        ScreenWidget.expression.value.selection =
            const TextSelection.collapsed(offset: 1);
      } else {
        _textBeforeCursor = ScreenWidget.expression.value.text
            .substring(0, ScreenWidget.expression.value.selection.baseOffset);
        if (_textBeforeCursor.isNotEmpty &&
            (_textBeforeCursor[_textBeforeCursor.length - 1] == '–' ||
                _textBeforeCursor[_textBeforeCursor.length - 1] == '+')) {
          _textBeforeCursor =
              _textBeforeCursor.substring(0, _textBeforeCursor.length - 1);
        }

        _textAfterCursor = ScreenWidget.expression.value.text.substring(
            ScreenWidget.expression.value.selection.baseOffset,
            ScreenWidget.expression.value.text.length);

        if (_textAfterCursor.isNotEmpty) {
          while (!(_textAfterCursor.codeUnitAt(0) >= 48 &&
              _textAfterCursor.codeUnitAt(0) <= 57)) {
            _textAfterCursor =
                _textAfterCursor.substring(1, _textAfterCursor.length);
          }
        }
        ScreenWidget.expression.value.text =
            '$_textBeforeCursor–$_textAfterCursor';
        _cursorPosition = _textBeforeCursor.length + 1;
        ScreenWidget.expression.value.selection =
            TextSelection.collapsed(offset: _cursorPosition);
      }
    } else if (symbol == "%") {
      if (ScreenWidget.expression.value.selection.baseOffset > 0) {
        _textBeforeCursor = ScreenWidget.expression.value.text
            .substring(0, ScreenWidget.expression.value.selection.baseOffset);
        if (_textBeforeCursor.endsWith('+') ||
            _textBeforeCursor.endsWith('–') ||
            _textBeforeCursor.endsWith('×') ||
            _textBeforeCursor.endsWith('÷')) {
          return;
        }
        _textAfterCursor = ScreenWidget.expression.value.text
            .substring(ScreenWidget.expression.value.selection.baseOffset);
        ScreenWidget.expression.value.text =
            '$_textBeforeCursor%$_textAfterCursor';
        _cursorPosition = _textBeforeCursor.length + 1;
        ScreenWidget.expression.value.selection =
            TextSelection.collapsed(offset: _cursorPosition);
      }
    } else {
      if (ScreenWidget.expression.value.selection.baseOffset > 0) {
        _textBeforeCursor = ScreenWidget.expression.value.text
            .substring(0, ScreenWidget.expression.value.selection.baseOffset);
        if (_textBeforeCursor.length == 1 && _textBeforeCursor == '–') {
          return;
        }
        while (_textBeforeCursor.isNotEmpty &&
            (_textBeforeCursor[_textBeforeCursor.length - 1] == '÷' ||
                _textBeforeCursor[_textBeforeCursor.length - 1] == '×' ||
                _textBeforeCursor[_textBeforeCursor.length - 1] == '–' ||
                _textBeforeCursor[_textBeforeCursor.length - 1] == '+')) {
          _textBeforeCursor =
              _textBeforeCursor.substring(0, _textBeforeCursor.length - 1);
        }

        _textAfterCursor = ScreenWidget.expression.value.text
            .substring(ScreenWidget.expression.value.selection.extentOffset);
        while (_textAfterCursor.isNotEmpty &&
            (_textAfterCursor[0] == '÷' ||
                _textAfterCursor[0] == '×' ||
                _textAfterCursor[0] == '–' ||
                _textAfterCursor[0] == '+' ||
                _textAfterCursor[0] == '%')) {
          _textAfterCursor =
              _textAfterCursor.substring(1, _textAfterCursor.length);
        }

        ScreenWidget.expression.value.text =
            _textBeforeCursor + symbol + _textAfterCursor;
        _cursorPosition = _textBeforeCursor.length + 1;
        ScreenWidget.expression.value.selection =
            TextSelection.collapsed(offset: _cursorPosition);
      }
    }
    _scroller();

    setAnswer(ScreenWidget.expression.value.text);
  }

  Future<void> point() async {
    if (ScreenWidget.expression.value.text.isEmpty) {
      ScreenWidget.expression.value.text =
          "0.${ScreenWidget.expression.value.text}";
      ScreenWidget.expression.value.selection =
          const TextSelection.collapsed(offset: 2);
    } else if (!_checkPoint()) {
      _textBeforeCursor = ScreenWidget.expression.value.text
          .substring(0, ScreenWidget.expression.value.selection.baseOffset);
      _textAfterCursor = ScreenWidget.expression.value.text.substring(
          ScreenWidget.expression.value.selection.extentOffset,
          ScreenWidget.expression.value.text.length);

      if (_textBeforeCursor.endsWith('+') ||
          _textBeforeCursor.endsWith('–') ||
          _textBeforeCursor.endsWith('×') ||
          _textBeforeCursor.endsWith('÷')) {
        ScreenWidget.expression.value.text =
            '${_textBeforeCursor}0.$_textAfterCursor';
        _cursorPosition = _textBeforeCursor.length + 2;
        ScreenWidget.expression.value.selection =
            TextSelection.collapsed(offset: _cursorPosition);
      } else {
        ScreenWidget.expression.value.text =
            '$_textBeforeCursor.$_textAfterCursor';
        _cursorPosition = _textBeforeCursor.length + 1;
        ScreenWidget.expression.value.selection =
            TextSelection.collapsed(offset: _cursorPosition);
      }

      _scroller();

      setAnswer(ScreenWidget.expression.value.text);
    }
  }

  void backSpace() {
    if (ScreenWidget.expression.value.selection.baseOffset > 0) {
      _textBeforeCursor = ScreenWidget.expression.value.text
          .substring(0, ScreenWidget.expression.value.selection.baseOffset - 1);
      _textAfterCursor = ScreenWidget.expression.value.text.substring(
          ScreenWidget.expression.value.selection.extentOffset,
          ScreenWidget.expression.value.text.length);
      ScreenWidget.expression.value.text =
          "$_textBeforeCursor$_textAfterCursor";
      _cursorPosition = _textBeforeCursor.length;
      ScreenWidget.expression.value.selection =
          TextSelection.collapsed(offset: _cursorPosition);
    }
    setAnswer(ScreenWidget.expression.value.text);
  }

  Future<void> equal() async {
    if (ScreenWidget.ans.value.isNotEmpty) {
      ScreenWidget.expression.value.text = ScreenWidget.ans.value;
    }
    _scroller();
  }
}

Future<void> _scroller() async {
  await Future.delayed(const Duration(milliseconds: 0));
  ScreenWidget.scrollController.value
      .jumpTo(ScreenWidget.scrollController.value.position.pixels);
  ScreenWidget.focus.value.unfocus();
  await Future.delayed(const Duration(milliseconds: 0));
  ScreenWidget.focus.value.requestFocus();
}

bool _checkPoint() {
  var start = ScreenWidget.expression.value.selection.baseOffset - 1;
  while (start != -1 &&
      (ScreenWidget.expression.value.text[start] == '.' ||
          ScreenWidget.expression.value.text.codeUnitAt(start) >= 47 &&
              ScreenWidget.expression.value.text.codeUnitAt(start) <= 58)) {
    if (ScreenWidget.expression.value.text[start] == '.') {
      return true;
    }
    start--;
  }

  var end = ScreenWidget.expression.value.selection.baseOffset;
  while (end < ScreenWidget.expression.value.text.length &&
      (ScreenWidget.expression.value.text[end] == '.' ||
          ScreenWidget.expression.value.text.codeUnitAt(end) >= 47 &&
              ScreenWidget.expression.value.text.codeUnitAt(end) <= 58)) {
    if (ScreenWidget.expression.value.text[end] == '.') {
      return true;
    }
    end++;
  }

  return false;
}

bool _searchFunction(String myString, String searchValue) {
  if (myString == searchValue) {
    return true;
  }
  int count = 0;
  var searchFor = searchValue.split(" ");
  for (final searchWord in searchFor) {
    if (myString.contains(searchWord)) {
      count++;
    }
  }
  return count == searchFor.length;
}

void setAnswer(String expression) {
  String answer;
  expression = expression.replaceAll('×', '*');
  expression = expression.replaceAll('÷', '/');
  expression = expression.replaceAll('–', '-');
  // below logic is for if % occurs then how to handle it
  while (expression.contains("%")) {
    String num = "";
    int i = expression.indexOf('%');
    // for getting right operator and remaining expression from right of %
    String rightOp = "";
    String rightHalf = "";
    if (i < expression.length - 1) {
      rightOp = expression[i + 1];
      if (rightOp != "+" &&
          rightOp != "-" &&
          rightOp != "*" &&
          rightOp != "/") {
        rightOp = "*";
        rightHalf = expression.substring(i + 1, expression.length);
      } else {
        rightHalf = expression.substring(i + 2, expression.length);
      }
    }

    // for getting number with which % occur
    i--;
    if (i != 0) {
      while (i >= 0 &&
          expression[i] != "+" &&
          expression[i] != "-" &&
          expression[i] != "/" &&
          expression[i] != "*") {
        num = expression[i] + num;
        i--;
      }
    }
    if (num.isEmpty) {
      num = "1";
    }
    // for getting left operator of % and remaining expression left side of %
    String leftOp = "";
    if (i >= 0) {
      leftOp = expression[i];
    }
    String leftHalf = "";
    for (int j = 0; j < i; j++) {
      leftHalf += expression[j];
    }

    // now concate according to conditions
    if ((leftOp == "+" || leftOp == "-") &&
        (rightOp == "+" || rightOp == "-" || rightOp == "")) {
      expression = "$leftHalf$leftOp($num/100*($leftHalf))";
    } else {
      expression = "$leftHalf$leftOp($num/100)";
    }
    if (rightOp != "") {
      expression = expression + rightOp + rightHalf;
    }
  }

  try {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    if (_searchFunction(expression, '+') ||
        _searchFunction(expression, '-') ||
        _searchFunction(expression, '*') ||
        _searchFunction(expression, '/') ||
        _searchFunction(expression, '/100')) {
      answer = exp.evaluate(EvaluationType.REAL, cm).toString();
      if (answer[answer.length - 1] == '0' &&
          answer[answer.length - 2] == '.') {
        ScreenWidget.ans.value = answer.substring(0, answer.indexOf('.'));
      } else {
        ScreenWidget.ans.value = answer;
      }
    } else {
      ScreenWidget.ans.value = '';
    }
  } catch (e) {
    ScreenWidget.ans.value = '';
  }
}

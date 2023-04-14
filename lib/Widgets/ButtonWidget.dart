// ignore: file_names
import 'package:flutter/material.dart';

import '../Logics/logics.dart';
import 'ScreenWidget.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({Key? key}) : super(key: key);
  Button b = Button();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                      onPressed: () {
                        ScreenWidget.expression.value.text = "";
                        ScreenWidget.ans.value = "";
                      },
                      child: const Text("C")),
                )),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                      onPressed: () {
                        b.operation('÷');
                      },
                      child: const Text("÷")),
                )),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                      onPressed: () {
                        b.operation('×');
                      },
                      child: const Text("×")),
                )),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                    onPressed: () {
                      b.backSpace();
                    },
                    child: const Text("⌫"),
                    onLongPress: () {
                      ScreenWidget.expression.value.text = "";
                      ScreenWidget.ans.value = "";
                    },
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20)),
                    color: Colors.deepPurple,
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("7");
                      },
                      child: const Text(
                        "7",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("8");
                      },
                      child: const Text(
                        "8",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20)),
                    color: Colors.deepPurple,
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("9");
                      },
                      child: const Text(
                        "9",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                      onPressed: () {
                        b.operation("–");
                      },
                      child: const Text("–")),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: Color(0xFF673AB7),
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("4");
                      },
                      child: const Text(
                        "4",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border(
                        top: BorderSide(width: 0, color: Colors.deepPurple),
                        bottom: BorderSide(width: 0, color: Colors.deepPurple),
                        right: BorderSide(width: 0, color: Colors.deepPurple),
                        left: BorderSide(width: 0, color: Colors.deepPurple)),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("5");
                      },
                      child: const Text(
                        "5",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("6");
                      },
                      child: const Text(
                        "6",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                      onPressed: () {
                        b.operation("+");
                      },
                      child: const Text("+")),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                    color: Colors.deepPurple,
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("1");
                      },
                      child: const Text(
                        "1",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("2");
                      },
                      child: const Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(20)),
                    color: Colors.deepPurple,
                    border: Border(
                      top: BorderSide(width: 0, color: Colors.deepPurple),
                      bottom: BorderSide(width: 0, color: Colors.deepPurple),
                      right: BorderSide(width: 0, color: Colors.deepPurple),
                      left: BorderSide(width: 0, color: Colors.deepPurple),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        b.number("3");
                      },
                      child: const Text(
                        "3",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                      onPressed: () {
                        b.operation("%");
                      },
                      child: const Text("%")),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                border: Border(
                                  top: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                  bottom: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                  right: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                  left: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                )),
                            child: TextButton(
                                onPressed: () {
                                  b.number("0");
                                },
                                child: const Text(
                                  "0",
                                  style: TextStyle(color: Colors.white),
                                )),
                          )),
                          Expanded(
                              child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                border: Border(
                                  top: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                  bottom: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                  right: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                  left: BorderSide(
                                      width: 0, color: Colors.deepPurple),
                                ),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20))),
                            child: TextButton(
                                onPressed: () {
                                  b.point();
                                },
                                child: const Text(
                                  ".",
                                  style: TextStyle(color: Colors.white),
                                )),
                          )),
                        ],
                      ),
                    ),
                  ]),
                ),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextButton(
                      onPressed: () {
                        b.equal();
                      },
                      child: const Text("=")),
                )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

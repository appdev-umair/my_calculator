import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({Key? key}) : super(key: key);
  static ValueNotifier<TextEditingController> expression =
      ValueNotifier(TextEditingController());
  static ValueNotifier<String> ans = ValueNotifier('');
  static ValueNotifier<FocusNode> focus = ValueNotifier(FocusNode());
  static ValueNotifier<ScrollController> scrollController =
      ValueNotifier(ScrollController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
            valueListenable: scrollController,
            builder: (BuildContext context, ScrollController scrollController,
                Widget) {
              return ValueListenableBuilder(
                  valueListenable: focus,
                  builder:
                      (BuildContext context, FocusNode myFocusNode, Widget) {
                    return ValueListenableBuilder(
                        valueListenable: expression,
                        builder: (BuildContext context,
                            TextEditingController expression, Widget) {
                          return Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeTextField(
                                controller: expression,
                                style: const TextStyle(fontSize: 70),
                                minFontSize: 40,
                                stepGranularity: 10,
                                keyboardType: TextInputType.none,
                                textAlign: TextAlign.right,
                                scrollController: scrollController,
                                focusNode: myFocusNode,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ValueListenableBuilder(
                                    valueListenable: ans,
                                    builder: (context, value, child) {
                                      return Text(
                                        ans.value,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            fontSize: 40, color: Colors.grey),
                                      );
                                    },
                                  )),
                            ],
                          ));
                        });
                  });
            }),
      ),
    );
  }
}

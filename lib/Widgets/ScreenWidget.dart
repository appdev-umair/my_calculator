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
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeTextField(
                                  controller: expression,
                                  style: const TextStyle(fontSize: 70),
                                  minFontSize: 20,
                                  stepGranularity: 10,
                                  keyboardType: TextInputType.none,
                                  textAlign: TextAlign.right,
                                  scrollController: scrollController,
                                  focusNode: myFocusNode,
                                  decoration: const InputDecoration(
                                    enabled: true,
                                    focusColor: Colors.deepPurple,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.deepPurple,
                                            width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.deepPurple,
                                            width: 2)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.deepPurple,
                                            width: 2)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.deepPurple,
                                            width: 2)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
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
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  });
            }),
      ),
    );
  }
}

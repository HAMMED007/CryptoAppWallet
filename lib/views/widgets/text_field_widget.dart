import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String titleText;
  final int minLines;
  final int maxLines;
  String? trailingIcon;
  Function? trailingFuntion;
  String? hintText;
  bool obscureText;
  TextFieldWidget(
      {Key? key,
      required this.textController,
      required this.titleText,
      this.obscureText = false,
      this.trailingIcon,
      this.trailingFuntion,
      this.hintText,
      this.minLines = 1,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: TextField(
            obscureText: obscureText,
            minLines: minLines,
            
            maxLines: maxLines,
            style: TextStyle(color: Colors.black, fontSize: 15),
            cursorColor: Colors.black,
            controller: textController,
            decoration: InputDecoration(
              suffixIcon:
                  trailingIcon != null
                  ? GestureDetector(
                      onTap: () => {trailingFuntion!()},
                      child: Image.asset(trailingIcon!))
                  : null,
              hintText: hintText ?? "",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              focusColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.0),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              labelText: titleText,
              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}

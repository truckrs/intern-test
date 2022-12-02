import 'package:flutter/material.dart';

import 'theme.dart';

InputBorder borderDecorationDark = OutlineInputBorder(
  borderSide: const BorderSide(color: purple),
  borderRadius: BorderRadius.circular(boxRadius),
);

Widget textFieldLabelDark(String text) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: textDarkStyle,
          )));
}

Widget passwordFieldDark(TextEditingController controller, String hintText, {List<String>? autofillHints}) {
  return TextField(
    style: textDarkStyle,
    cursorColor: Colors.white,
    autofillHints: autofillHints ?? [AutofillHints.password],
    decoration: InputDecoration(
        hintStyle: hintDarkStyle, border: borderDecorationDark, enabledBorder: borderDecorationDark, focusedBorder: borderDecorationDark, hintText: hintText),
    controller: controller,
  );
}

Widget textFieldDark(TextEditingController controller, String hintText, {List<String>? autofillHints}) {
  return TextField(
    style: textDarkStyle,
    cursorColor: Colors.white,
    autofillHints: autofillHints,
    decoration: InputDecoration(
        hintStyle: hintDarkStyle, border: borderDecorationDark, enabledBorder: borderDecorationDark, focusedBorder: borderDecorationDark, hintText: hintText),
    controller: controller,
  );
}

Widget getScrollViewColumnScaffold(BuildContext context, List<Widget> children,
    {CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) {
  return getBackgroundScaffold(SingleChildScrollView(
    reverse: true,
    child: Padding(
      padding: themePadding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    ),
  ));
}

Widget getBackgroundScaffold(child) {
  return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background.jpg"), fit: BoxFit.cover),
          ),
          child: child));
}

Widget _createButton(List<Widget> children, Function pressedFun, Color backgroundColor, double borderRadius, {width = 0.5, style}) {
  return ElevatedButton(
      onPressed: () {
        pressedFun();
      },
      style: style ??
          ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 18)),
              backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                side: BorderSide(width: width, color: purple),
                borderRadius: BorderRadius.circular(borderRadius),
              ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ));
}

Widget createButton(String label, Function pressedFun, {isEnable = true, style}) {
  Color backgroundColor = purple.withOpacity(isEnable ? 1 : 0.3);
  FontWeight fontWeight = FontWeight.normal;
  fontWeight = FontWeight.w700;
  double fontSize = 14;

  return _createButton([
    Text(
      label,
      style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
    )
  ], isEnable ? pressedFun : () => {}, backgroundColor, boxRadius, width: 2.0, style: style);
}

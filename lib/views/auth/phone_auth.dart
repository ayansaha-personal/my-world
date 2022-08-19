import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/design/layout.dart';
import 'package:ui/design/texts.dart';

class PhoneAuthView extends StatefulWidget {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool canProceed = false;
  bool otpSent = false;
  @override
  Widget build(BuildContext context) {
    setSystemTheme(Colors.black, Colors.black);
    return Scaffold(
      body: Container(
        padding: defaultViewPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36.0),
              child: Image.asset('images/phone_auth.png'),
            ),
            Text(
              otpSent ? 'Verify Your Phone' : 'Login with Phone',
              style: headerText,
            ),
            Text(
                'Enter ${otpSent ? 'received OTP': 'your phone number'}',
                style: bodyText),
            Row(
              children: otpSent ? [
                Expanded(
                  child: TextField(
                    controller: otpController,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintStyle: hintText,
                        hintText: '000000',
                        suffixStyle: inputText,
                        counter: Container()),
                    style: inputText,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                )
              ] :[
                Expanded(
                    flex: 1,
                    child: TextField(
                      controller: countryController,
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '+',
                          hintStyle: hintText,
                          hintText: '000',
                          suffixStyle: inputText,
                          counter: Container()),
                      style: inputText,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    )),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: phoneController,
                    maxLength: 10,
                    onChanged: (value) {
                      canProceed = value.length == 10 && countryController.value.text.isNotEmpty;
                      setState(() {});
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintStyle: hintText,
                        hintText: '0000000000',
                        counter: Container()),
                    style: inputText,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  canProceed ? showFloatingButton(Icons.next_plan_outlined, () {
                    if (!otpSent) {
                      otpSent = true;
                    }
                    setState(() {});
                  }): Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

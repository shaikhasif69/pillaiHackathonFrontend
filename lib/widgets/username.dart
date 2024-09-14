import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/components/constant.dart';

class InputTextContainer extends StatefulWidget {
  // const InputTextContainer({
  //   required this.con,
  //   required this.vadliateUsername,
  // });

  // final TextEditingController con;
  // final Function vadliateUsername;

  @override
  State<StatefulWidget> createState() {
    return _InputTextContainer();
  }
}

class _InputTextContainer extends State<InputTextContainer> {
  String _username = "";
  bool _vusername = false;
  Widget? status = null;
  String? error = null;
  bool isLable = true;
  bool showBorder = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        showBorder = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 247, 247),
            borderRadius: BorderRadius.circular(20),
            border: showBorder
                ? Border.all(width: 1.5, color: MyColors.ourPrimary)
                : Border.all(width: 0.5, color: Colors.black)),
        child: Stack(
          children: [
            TextFormField(
              // controller: widget.con,
              focusNode: _focusNode,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.none,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 60, right: 40),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: error != null ? Icon(Icons.close) : status,
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: Icon(Icons.account_box_outlined),
                  ),
                ),
                focusedBorder: InputBorder.none,
                focusColor: Colors.black26,
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            Positioned(
              left: 40,
              top: 12,
              child: Text(
                isLable ? "Username" : "",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

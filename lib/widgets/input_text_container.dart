import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/components/constant.dart';

class InputTextContainer extends StatefulWidget {
  const InputTextContainer({
    required this.con,
    required this.label,
    this.isPassword = false,
  });

  final TextEditingController con;
  final String label;
  final bool isPassword;

  @override
  State<StatefulWidget> createState() {
    return _InputTextContainer();
  }
}

class _InputTextContainer extends State<InputTextContainer> {
  bool showBorder = false;
  bool isPasswordVisible = false;
  bool isLabelVisible = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Listener for the focus node
    _focusNode.addListener(() {
      setState(() {
        showBorder = _focusNode.hasFocus;
      });
    });

    // Listener for the controller to hide the label when text is entered
    widget.con.addListener(() {
      setState(() {
        isLabelVisible = widget.con.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    // FocusScope.of(context).unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 247, 247),
          borderRadius: BorderRadius.circular(12),
          border: showBorder
              ? Border.all(width: 1.5, color: MyColors.ourPrimary)
              : Border.all(width: 0.5, color: Colors.black),
        ),
        child: Stack(
          children: [
            TextFormField(
              controller: widget.con,
              focusNode: _focusNode,
              obscureText: widget.isPassword && !isPasswordVisible,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: widget.isPassword
                  ? TextInputType.text
                  : TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: MyColors.ourPrimary,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      )
                    : null,
                prefixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Icon(
                    widget.isPassword
                        ? Icons.lock_outline
                        : Icons.account_box_outlined,
                    color: MyColors.ourPrimary,
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
            // Show the label only if there is no text entered
            if (isLabelVisible)
              Positioned(
                left: 50,
                top: 14,
                child: Text(
                  widget.label,
                  style: const TextStyle(
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

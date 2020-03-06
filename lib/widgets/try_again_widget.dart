import 'package:flutter/material.dart';

class TryAgainWidget extends StatelessWidget {
  final String buttonText;
  final String errorMessage;
  final VoidCallback onTryAgain;
  final TextStyle messageStyle;

  final TextStyle buttonTextStyle;

  const TryAgainWidget({
    Key key,
    @required this.errorMessage,
    this.onTryAgain,
    this.buttonText,
    this.messageStyle,
    this.buttonTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          errorMessage ?? '',
          style: messageStyle,
        ),
        if (onTryAgain != null)
          FlatButton(
              onPressed: () => onTryAgain(),
              child: Text(
                buttonText ?? 'Try Again',
                style: buttonTextStyle,
              ))
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? leadingIcon;
  final IconData trailingIcon;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final Color splashColor;
  final EdgeInsets padding;

  const BorderButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward_ios,
    this.borderColor = Colors.black12,
    this.textColor = Colors.black54,
    this.iconColor = Colors.black87,
    this.splashColor = Colors.grey,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: splashColor,
          highlightColor: splashColor.withOpacity(0.4),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: borderColor, width: 1),
                bottom: BorderSide(color: borderColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Leading icon and label
                Row(
                  children: [
                    if (leadingIcon != null) ...[
                      Icon(leadingIcon, color: iconColor),
                      SizedBox(width: 8),
                    ],
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      label,
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ],
                ),
                // Trailing arrow
                Icon(trailingIcon, size: 16, color: iconColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

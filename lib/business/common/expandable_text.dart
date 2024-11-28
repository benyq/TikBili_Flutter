import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? textStyle;

  const ExpandableText({
    Key? key,
    required this.text,
    required this.maxLines,
    this.textStyle,
  }) : super(key: key);

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final maxWidth = constraints.maxWidth;
        final textSpan = TextSpan(
          text: widget.text,
          style: widget.textStyle ?? const TextStyle(color: Colors.black),
        );

        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isExpanded
                ? _buildExpandedText()
                : _buildCollapsedText(textPainter, maxWidth),
          ],
        );
      },
    );
  }

  Widget _buildCollapsedText(TextPainter textPainter, double maxWidth) {

    final expandSpan = TextSpan(
      text: " 展开",
      style: const TextStyle(color: Colors.blue),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
    );

    final linkTextSpan = TextSpan(
      text: '...',
      style: widget.textStyle ?? const TextStyle(color: Colors.black),
      children: [expandSpan],
    );

    final linkPainter = TextPainter(
      text: linkTextSpan,
      textDirection: TextDirection.ltr,
    );
    linkPainter.layout();

    final showMoreText = (textPainter.width / maxWidth ) > 2;

    if (!showMoreText) {
      return Text(widget.text, style: widget.textStyle, maxLines: widget.maxLines, overflow: TextOverflow.ellipsis,);
    }

    final displayTextWidth = widget.maxLines * maxWidth;
    final position = textPainter.getPositionForOffset(
        Offset(displayTextWidth - linkPainter.width, textPainter.height));
    final endOffset =
        textPainter.getOffsetBefore(position.offset) ?? position.offset;
    final truncatedText = widget.text.substring(0, endOffset - 1);


    return RichText(
      text: TextSpan(
        text: truncatedText,
        style: widget.textStyle ?? const TextStyle(color: Colors.black),
        children: [linkTextSpan],
      ),
      maxLines: widget.maxLines,
      overflow: TextOverflow.clip,
    );
  }

  Widget _buildExpandedText() {
    final collapseSpan = TextSpan(
      text: " 收起",
      style: const TextStyle(color: Colors.blue),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
    );

    return RichText(
      text: TextSpan(
        text: widget.text,
        style: widget.textStyle ?? const TextStyle(color: Colors.black),
        children: [collapseSpan],
      ),
    );
  }
}

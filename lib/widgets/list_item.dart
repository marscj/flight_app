import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 列表项
class ListItem extends StatefulWidget {
  // 点击事件
  final VoidCallback onPressed;
  // 图标
  final Widget icon;
  // 标题
  final String title;
  final Color titleColor;
  // 描述
  final String describe;
  final Color describeColor;
  // 右侧控件
  final Widget rightWidget;

  // 构造函数
  ListItem({
    Key key,
    this.onPressed,
    this.icon,
    this.title,
    this.titleColor: Colors.black,
    this.describe,
    this.describeColor: Colors.grey,
    this.rightWidget,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.onPressed,
      padding: EdgeInsets.all(0.0),
      shape: Border.all(
        color: Colors.transparent,
        width: 0.0,
        style: BorderStyle.none,
      ),
      child: Container(
          width: double.infinity,
          // height: 60,
          child: Row(
            children: <Widget>[
              widget.icon != null
                  ? Container(
                      padding: EdgeInsets.all(14.0),
                      child: SizedBox(
                        height: 32.0,
                        width: 32.0,
                        child: widget.icon,
                      ),
                    )
                  : Container(
                      width: 14.0,
                    ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    widget.title != null
                        ? AutoSizeText(widget.title,
                            maxLines: 1,
                            style: TextStyle(
                              color: widget.titleColor,
                              fontSize: 14.0,
                            ))
                        : Container(),
                    widget.describe != null
                        ? AutoSizeText(
                            widget.describe,
                            style: GoogleFonts.unna(
                                color: widget.describeColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          )
                        : Container(),
                  ],
                ),
              ),
              widget.rightWidget == null ? Container() : widget.rightWidget,
              Container(
                width: 14.0,
              ),
            ],
          )),
    );
  }
}

/// 空图标
class EmptyIcon extends Icon {
  const EmptyIcon() : super(Icons.hourglass_empty);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

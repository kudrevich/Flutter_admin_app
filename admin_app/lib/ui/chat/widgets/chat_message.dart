import 'package:admin_app/classes/chat_colors.dart';
import 'package:admin_app/classes/message.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ChatMessage extends StatelessWidget {
  final Message message;
  final bool date;
  final DateTime timeOfMessage;
  final String phone;
  final String chatID;
  ChatMessage(
      {@required this.message,
      this.date = false,
      @required this.phone,
      @required this.chatID})
      : this.timeOfMessage = message.time;

  @override
  Widget build(BuildContext context) {
    var minutes = message.time.minute;
    var displayedMinutes = minutes >= 0 && minutes <= 9
        ? "0" + minutes.toString()
        : minutes.toString();
    var hours = message.time.hour;
    var displayedHours =
        hours >= 0 && hours <= 9 ? "0" + hours.toString() : hours.toString();
    var time = displayedHours + ":" + displayedMinutes;

    Widget _getTime({bool flag = false}) {
      return Text(
        time,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: ResponsiveSize.responsiveHeight(10, context),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          color:
              flag ? Colors.white : Theme.of(context).textTheme.bodyText2.color,
        ),
      );
    }

    Widget buildTextMessage() {
      return Container(
        padding: EdgeInsets.only(
          right: ResponsiveSize.responsiveWidth(6, context),
          left: ResponsiveSize.responsiveWidth(9, context),
          top: ResponsiveSize.responsiveHeight(4, context),
          bottom: ResponsiveSize.responsiveHeight(5, context),
        ),
        constraints: BoxConstraints(
          maxWidth: ResponsiveSize.responsiveWidth(275, context),
        ),
        decoration: BoxDecoration(
          color: message.type == TypeMessage.text
              ? Theme.of(context).cardColor
              : Colors.orange,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: ResponsiveSize.responsiveWidth(219, context),
              ),
              child: Text(
                message.content,
                style: TextStyle(
                  fontSize: ResponsiveSize.responsiveHeight(18, context),
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
            ),
            SizedBox(
              width: ResponsiveSize.responsiveWidth(5, context),
            ),
            message.type == TypeMessage.text
                ? _getTime()
                : _getTime(flag: true),
          ],
        ),
      );
    }

    String _getMonth() {
      switch (message.time.month) {
        case 1:
          return 'Января';
          break;
        case 2:
          return 'Февраля';
          break;
        case 3:
          return 'Марта';
          break;
        case 4:
          return 'Апреля';
          break;
        case 5:
          return 'Мая';
          break;
        case 6:
          return 'Июня';
          break;
        case 7:
          return 'Июля';
          break;
        case 8:
          return 'Августа';
          break;
        case 9:
          return 'Сентября';
          break;
        case 10:
          return 'Октября';
          break;
        case 11:
          return 'Ноября';
          break;
        default:
          return 'Декабря';
      }
    }

    Widget messageWidget() => GestureDetector(
          onTap: () async {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: message.sender == 'User'
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: <Widget>[
              message.sender == 'User'
                  ? Container(
                      margin: EdgeInsets.only(
                        left: ResponsiveSize.responsiveWidth(5, context),
                        bottom: ResponsiveSize.responsiveHeight(7, context),
                      ),
                      height: ResponsiveSize.responsiveHeight(50, context),
                      width: ResponsiveSize.responsiveHeight(50, context),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ChatColors.userColor(phone),
                          ),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.person,
                        color: ChatColors.userColor(phone),
                        size: ResponsiveSize.responsiveHeight(40, context),
                      ),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(
                  bottom: ResponsiveSize.responsiveHeight(10, context),
                  right: message.sender == 'Superuser'
                      ? ResponsiveSize.responsiveWidth(15, context)
                      : 0,
                  left: message.sender == 'User'
                      ? ResponsiveSize.responsiveWidth(5, context)
                      : 0,
                ),
                child: buildTextMessage(),
              ),
            ],
          ),
        );

    if (!date) {
      return messageWidget();
    } else {
      return Column(
        children: [
          Text(
            message.time.day.toString() + " " + _getMonth(),
            style: TextStyle(
              fontSize: ResponsiveSize.responsiveHeight(12, context),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          SizedBox(
            height: ResponsiveSize.responsiveHeight(7, context),
          ),
          messageWidget(),
        ],
      );
    }
  }
}

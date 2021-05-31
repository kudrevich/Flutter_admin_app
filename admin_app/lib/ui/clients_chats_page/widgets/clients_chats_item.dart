import 'package:admin_app/classes/chat_colors.dart';
import 'package:admin_app/classes/chat_data.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/chat/chat.dart' as wdgt;
import 'package:flutter/material.dart';

class ClientsChatsItem extends StatelessWidget {
  final ChatData chatData;

  ClientsChatsItem(this.chatData);
  @override
  Widget build(BuildContext context) {
    var minutes = chatData.lastMsg.time.minute;
    var displayedMinutes = minutes >= 0 && minutes <= 9
        ? "0" + minutes.toString()
        : minutes.toString();
    var hours = chatData.lastMsg.time.hour;
    var displayedHours =
        hours >= 0 && hours <= 9 ? "0" + hours.toString() : hours.toString();
    var time = displayedHours + ":" + displayedMinutes;

    var strms = chatData.lastMsg.content;
    var message = strms.length > 33
        ? strms.replaceAll('\n', ' ').trim().substring(0, 29) + "..."
        : strms.replaceAll('\n', ' ').trim();

    var displayedMessage =
        chatData.lastMsg.sender == "Superuser" ? "Вы: " + message : message;

    bool unread = !chatData.lastMsg.status && chatData.lastMsg.sender == "User";

    return Column(
      children: [
        Container(
          color: Colors.grey.withOpacity(0.15),
          height: ResponsiveSize.responsiveHeight(1, context),
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => wdgt.Chat(chatData.id, chatData.phoneNumber),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: ResponsiveSize.responsiveWidth(10, context),
            ),
            height: ResponsiveSize.responsiveHeight(60, context),
            child: Row(
              children: [
                Container(
                  height: ResponsiveSize.responsiveHeight(50, context),
                  width: ResponsiveSize.responsiveHeight(50, context),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ChatColors.userColor(chatData.phoneNumber),
                      ),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    color: ChatColors.userColor(chatData.phoneNumber),
                    size: ResponsiveSize.responsiveHeight(40, context),
                  ),
                ),
                SizedBox(
                  width: ResponsiveSize.responsiveWidth(15, context),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: ResponsiveSize.responsiveWidth(265, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            chatData.phoneNumber,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontFamily,
                              fontSize:
                                  ResponsiveSize.responsiveHeight(16, context),
                            ),
                          ),
                          Row(
                            children: [
                              !unread
                                  ? Container(
                                      height: ResponsiveSize.responsiveHeight(
                                          16, context),
                                      width: ResponsiveSize.responsiveWidth(
                                          20, context),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      height: ResponsiveSize.responsiveHeight(
                                          16, context),
                                      width: ResponsiveSize.responsiveWidth(
                                          20, context),
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "NEW",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize:
                                              ResponsiveSize.responsiveHeight(
                                                  7, context),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width:
                                    ResponsiveSize.responsiveWidth(7, context),
                              ),
                              Text(
                                time,
                                style: TextStyle(
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .fontFamily,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .color,
                                  fontStyle: FontStyle.italic,
                                  fontSize: ResponsiveSize.responsiveHeight(
                                      14, context),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Text(
                      displayedMessage,
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2.fontFamily,
                        color: Theme.of(context).textTheme.bodyText2.color,
                        fontSize: ResponsiveSize.responsiveHeight(14, context),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

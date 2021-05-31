import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/chat/widgets/chat_message.dart';
import 'package:admin_app/ui/chat/widgets/navbar_action_button.dart';
import 'package:admin_app/classes/message.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'chat_message.dart';

class ListOfMessagesAndNavbarChat extends StatefulWidget {
  final String chatID; 
  final String phoneNumber;

  ListOfMessagesAndNavbarChat(this.chatID, this.phoneNumber);

  @override
  _ListOfMessagesAndNavbarChatState createState() =>
      _ListOfMessagesAndNavbarChatState();
}

class _ListOfMessagesAndNavbarChatState
    extends State<ListOfMessagesAndNavbarChat> {
  TextEditingController textEditingController = TextEditingController();

  RefreshController _refreshController = RefreshController();
  List<ChatMessage> listOfMessages = [];

  bool needDate(Message msg, bool onMessage) {
    return onMessage
        ? (listOfMessages.isEmpty ||
            msg.time.day != listOfMessages.last.message.time.day)
        : (listOfMessages.isNotEmpty &&
            msg.time.day != listOfMessages.last.message.time.day);
  }

  addMessage(Message msg, {bool onMessage = false}) {
    setState(() {
      listOfMessages.add(
        ChatMessage(
          message: msg,
          phone: widget.phoneNumber,
          chatID: widget.chatID,
          date: needDate(msg, onMessage),
        ),
      );
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveSize.responsiveHeight(633, context),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: ResponsiveSize.responsiveHeight(5, context),
              ),
              height: ResponsiveSize.responsiveHeight(526, context),
              child: SmartRefresher(
                enablePullUp: true,
                enablePullDown: false,
                reverse: true,
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("");
                    } else if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator(
                        backgroundColor: Theme.of(context).accentColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      );
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: ResponsiveSize.responsiveHeight(50, context),
                      child: Center(child: body),
                    );
                  },
                ),
                header: null,
                controller: _refreshController,
                onLoading: () async {
                  _refreshController.loadComplete();
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: listOfMessages,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                  color: Color.fromRGBO(163, 174, 179, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 40,
                ),
              ],
            ),
            width: ResponsiveSize.responsiveWidth(360, context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: ResponsiveSize.responsiveWidth(10, context),
                    right: ResponsiveSize.responsiveWidth(10, context),
                    top: ResponsiveSize.responsiveHeight(4, context),
                    bottom: ResponsiveSize.responsiveHeight(4, context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NavbarActionButton(
                        color: Color(0xFFA1E8B1),
                        isIcon: true,
                        icon: Icons.phone,
                        childColor: Colors.white,
                        action: () {},
                      ),
                      Row(
                        children: [
                          NavbarActionButton(
                            color: Color(0xFFA1E8B1),
                            isIcon: true,
                            icon: Icons.attach_money,
                            childColor: Colors.white,
                            action: () {},
                          ),
                          SizedBox(
                            width: ResponsiveSize.responsiveWidth(15, context),
                          ),
                          NavbarActionButton(
                            color: Theme.of(context).primaryColor,
                            isIcon: false,
                            childColor: Colors.white,
                            text: "1",
                            action: () {},
                          ),
                          SizedBox(
                            width: ResponsiveSize.responsiveWidth(15, context),
                          ),
                          NavbarActionButton(
                            color: Theme.of(context).primaryColor,
                            isIcon: false,
                            childColor: Colors.white,
                            text: "2",
                            action: () {},
                          ),
                          SizedBox(
                            width: ResponsiveSize.responsiveWidth(15, context),
                          ),
                          NavbarActionButton(
                            color: Theme.of(context).primaryColor,
                            isIcon: false,
                            childColor: Colors.white,
                            text: "3",
                            action: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: ResponsiveSize.responsiveWidth(360, context),
                  height: ResponsiveSize.responsiveHeight(1, context),
                  color: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .color
                      .withOpacity(0.2),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: ResponsiveSize.responsiveWidth(10, context),
                    top: ResponsiveSize.responsiveHeight(5, context),
                    bottom: ResponsiveSize.responsiveHeight(5, context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NavbarActionButton(
                        color: Theme.of(context).primaryColor,
                        isIcon: true,
                        childColor: Colors.white,
                        icon: Icons.image,
                        action: () async {},
                      ),
                      Container(
                        width: ResponsiveSize.responsiveWidth(230, context),
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          minLines: 1,
                          maxLines: 5,
                          controller: textEditingController,
                          textInputAction: TextInputAction.newline,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Введите сообщение...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .fontFamily,
                              fontSize:
                                  ResponsiveSize.responsiveHeight(16, context),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          addMessage(
                            Message(
                              time: DateTime.now(),
                              sender: "Superuser",
                              type: TypeMessage.text,
                              content: textEditingController.value.text,
                            ),
                          );
                          textEditingController.text = "";
                        },
                        child: Container(
                          width: ResponsiveSize.responsiveWidth(50, context),
                          height: ResponsiveSize.responsiveHeight(40, context),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.send,
                              size:
                                  ResponsiveSize.responsiveHeight(21, context),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

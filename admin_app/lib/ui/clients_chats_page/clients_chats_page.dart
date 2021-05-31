import 'dart:io';

import 'package:admin_app/classes/chat_data.dart';
import 'package:admin_app/classes/message.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/clients_chats_page/widgets/clients_chats_appbar.dart';
import 'package:admin_app/ui/clients_chats_page/widgets/clients_chats_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//ignore: must_be_immutable
class ClientsChatsPage extends StatelessWidget {
  List<ClientsChatsItem> _clients = [
    ClientsChatsItem(
      ChatData(
        phoneNumber: "+79510245265",
        lastMsg: Message(
          time: DateTime.now(),
          sender: "Superuser",
          type: TypeMessage.text,
          content: "",
        ),
        id: "0",
        name: "Петр",
      ),
    ),
    ClientsChatsItem(
      ChatData(
        phoneNumber: "+79514230341",
        lastMsg: Message(
          time: DateTime.now(),
          sender: "Superuser",
          type: TypeMessage.text,
          content: "",
        ),
        id: "1",
        name: "Олег",
      ),
    ),
    ClientsChatsItem(
      ChatData(
        phoneNumber: "+79745302659",
        lastMsg: Message(
          time: DateTime.now(),
          sender: "Superuser",
          type: TypeMessage.text,
          content: "",
        ),
        id: "2",
        name: "Маша",
      ),
    ),
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              ClientsChatsAppbar(),
              Container(
                height: ResponsiveSize.responsiveHeight(633, context),
                child: SmartRefresher(
                  header: Platform.isAndroid
                      ? MaterialClassicHeader()
                      : ClassicHeader(
                          refreshingIcon: CupertinoActivityIndicator(),
                          refreshingText: '',
                          releaseIcon: CupertinoActivityIndicator(),
                          releaseText: '',
                          completeIcon: CupertinoActivityIndicator(),
                          completeText: '',
                          idleIcon: null,
                          idleText: '',
                        ),
                  controller: _refreshController,
                  physics: BouncingScrollPhysics(),
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
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  onRefresh: () {},
                  onLoading: () {
                    _refreshController.loadComplete();
                  },
                  enablePullUp: true,
                  child: SingleChildScrollView(
                    child: Column(
                      children: _clients,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

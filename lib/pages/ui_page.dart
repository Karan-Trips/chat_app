import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

class Uipage extends StatefulWidget {
  const Uipage({super.key});

  @override
  State<Uipage> createState() => _UipageState();
}

class _UipageState extends State<Uipage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(65),
              child: AppBar(
                elevation: 0,
                title: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "K-Chat",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
                actions: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12, right: 15),
                    child: Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  PopupMenuButton(
                      iconColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                                value: 1,
                                child: Text("New group",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500))),
                            const PopupMenuItem(
                                value: 2,
                                child: Text("New Broadcast",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500))),
                            const PopupMenuItem(
                                value: 3,
                                child: Text("Setting",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500))),
                            const PopupMenuItem(
                                value: 4,
                                child: Text("Starrted Messing",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500))),
                          ])
                ],
              )),
          body: Column(
            children: [
              Container(
                color: const Color(0xFF075E55),
                child: TabBar(
                  tabs: [
                    const SizedBox(
                      width: 25,
                      child: Tab(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Tab(
                        child: Row(
                          children: [
                            const Text(
                              "Chats",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 21,
                              width: 21,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: const Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF075E55)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                      child: Tab(
                        child: Text(
                          "Status",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 85,
                      child: Tab(
                        child: Text(
                          "Calls",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: Colors.white,

                  // isScrollable: true,
                  indicatorWeight: 4,
                  labelStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      // Tab for cam
                      Container(
                        color: Colors.black,
                      ),
                      // Tab for chat
                      const Chatpage(),
                      // Tab for status
                      Container(
                        color: const Color.fromARGB(255, 35, 22, 22),
                      ),
                      // Tab for calls
                      Container(
                        color: Colors.black,
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

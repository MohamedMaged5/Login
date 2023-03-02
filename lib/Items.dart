import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final mykey = GlobalKey<AnimatedListState>();
  List<Widget> list = [];

  int index = 0;
  onpressed(Widget value) {
    setState(() {
      list.add(value);
    });
  }

  ondeleted() {
    setState(() {
      list.length--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(203, 3, 10, 210),
        centerTitle: true,
        title: const Text(
          "Items",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              onpressed(widget);
            },
            icon: const Icon(Icons.add,
                color: Color.fromARGB(203, 3, 10, 210), size: 35),
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    duration: const Duration(milliseconds: 200),
                    delay: const Duration(milliseconds: 500),
                    position: index,
                    child: SlideAnimation(
                      curve: Curves.bounceOut,
                      verticalOffset: -500,
                      horizontalOffset: -500,
                      delay: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Chip(
                          backgroundColor:
                              const Color.fromARGB(203, 3, 10, 210),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          deleteIcon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          deleteButtonTooltipMessage:
                              const String.fromEnvironment("Deleted"),
                          onDeleted: () {
                            ondeleted();
                          },
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          labelPadding: const EdgeInsets.only(
                            right: 250,
                          ),
                          label: Text("Item${index + 1}"),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: list.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

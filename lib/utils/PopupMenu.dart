import 'package:flutter/material.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/modules/Alarm.dart';

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.background,
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            position: PopupMenuPosition.under,
            icon: Icon(
              Icons.more_vert,
              color: CustomColors.nightBackground,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    onTap: () {
                      Alarm();
                    },
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: CustomColors.nightBackground,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("alarm"),
                      ],
                    )),
                PopupMenuItem(
                    onTap: () {},
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_rounded,
                          color: CustomColors.nightBackground,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Hakkında"),
                      ],
                    )),
              ];
            },
          ),
        ],
      ),
    );
  }
}

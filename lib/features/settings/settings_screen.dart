import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
      print(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            activeColor: Colors.blue,
            value: _notifications,
            onChanged: _onNotificationsChanged,
            subtitle: const Text("Enalbe notifications"),
            title: const Text(
              "Enable notification",
            ),
          ),
          CheckboxListTile(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text("Enable notifications"),
          ),
          ListTile(
              title: const Text("What is your birthday?"),
              onTap: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2059));
                print(date);

                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                print(time);

                final booking = await showDateRangePicker(
                    builder: (context, child) {
                      return Theme(
                          data: ThemeData(
                              appBarTheme: const AppBarTheme(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          )),
                          child: child!);
                    },
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                print(booking);
              }),
          const AboutListTile(),
          ListTile(
            title: const Text(
              "Log Out (Ios)",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text(
                      "Are you sure?",
                    ),
                    content: const Text(
                      "no go",
                    ),
                    actions: [
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Yes",
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text(
                          "No",
                        ),
                      )
                    ],
                  );
                }),
          ),
          ListTile(
            title: const Text(
              "Log Out (Android)",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      "Are you sure?",
                    ),
                    content: const Text(
                      "no go",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Yes",
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "No",
                        ),
                      )
                    ],
                  );
                }),
          ),
          ListTile(
            title: const Text(
              "Log Out (Ios/ Bottom)",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoActionSheet(
                    message: const Text("Plz don't go"),
                    title: const Text(
                      "Are you sure?",
                    ),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Yes",
                        ),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text(
                          "No",
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_flutter/components/backgroundMessage.dart';

class AppConfigurationPage extends StatefulWidget {
  AppConfigurationPage({Key? key}) : super(key: key);
  @override
  _AppConfigurationPageState createState() => _AppConfigurationPageState();
}

class _AppConfigurationPageState extends State<AppConfigurationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        toolbarHeight: 75,
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Visual',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Divider(),
                SwitchListTile(
                  title: Text('Modo noturno'),
                  value: false,
                  onChanged: null,
                ),
              ],
            ),
          ),
          BackgroundMessage(message: 'Em desenvolvimento...'),
        ],
      ),
    );
  }
}

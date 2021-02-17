import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Não aglomera',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Não aglomera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _message = 'Pode entrar!';
  bool _canAdd = true;
  bool _canRemove = false;

  void _countPeople(int activity) {
    setState(() {
      _counter += activity;
      if(_counter > 0 && _counter < 20){
        _message = 'Pode entrar!';
        _canAdd = true;
        _canRemove = true;
      }
      else if (_counter == 20) {
        _message = 'Limite de pessoas alcançado!';
        _canAdd = false;
        _canRemove = true;
      }
      else if (_counter == 0){
        _message = 'Pode entrar!';
        _canAdd = true;
        _canRemove = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "Imagens/restaurant.jpeg",
          fit: BoxFit.cover,
          height: 1000.0,
          width: 1000.0,
        ),
        Center(
            child: Container(
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.group_rounded),
                              title: Text('Não aglomere!'),
                              subtitle: Text(
                                  'Verificador da capacidade do restaurante'
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Pessoas no restaurante: $_counter',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Row(
                                children: [
                                  Text(
                                    '$_message',
                                    style: TextStyle(
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    if(_canAdd){
                                      _countPeople(1);
                                    }
                                  },
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: Icon(
                                    Icons.person_remove_alt_1_rounded,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    if(_canRemove){
                                      _countPeople(-1);
                                    }
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                )
            )
        ),
      ],
    );
  }
}

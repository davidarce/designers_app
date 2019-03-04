import 'package:flutter/material.dart';
import 'model/designer.dart';
import 'repository/designer_database.dart';
import 'design_app_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designers App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'DESIGNERS'),
      debugShowCheckedModeBanner: false,
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

  final DesignerDatabase database = DesignerDatabase();
  final _designers = <Designer>[];
  final Set<Designer> _contacted = new Set<Designer>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _buildDesigners(),
            DesignAppBar(widget.title)
          ],
        )
    );
  }

  Widget _buildDesigners() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 120.0, left: 16.0, right: 16.0, bottom: 16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _designers.length) {
          _designers.addAll(database.generateDesigners());
        }
        return _buildRow(_designers[index]);
      },
    );
  }

  Widget _buildRow(Designer designer) {
    final bool alreadyContacted = _contacted.contains(designer);

    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: CircleAvatar(
          backgroundImage: AssetImage(designer.pathPhoto),
          radius: 28.0
      ),
      title:  Container(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            designer.fullName,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            "Experience: ${designer.experience} years",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black38),
          ),
        )
      ],
    ),
    ),
      trailing: Container(
        child: CircleAvatar(
          backgroundColor: alreadyContacted ? Colors.red : Color.fromRGBO(221, 221, 221, 1),
          radius: 25.0,
          child: Container(
            child: Icon(Icons.mail, color:  alreadyContacted ? Colors.white : Color.fromRGBO(108, 108, 108, 1),),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          if (alreadyContacted) {
            _contacted.remove(designer);
          } else {
            _contacted.add(designer);
          }
        });
      },
    );
  }

}

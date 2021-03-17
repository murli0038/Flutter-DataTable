import 'package:flutter/material.dart';
void main() => runApp(MyApp());
/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("DATA TABLE IN FLUTTER"),centerTitle: true,),
        body: MyStatelessWidget(),
      ),
    );
  }
}
/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  final children = <DataRow>[];

  @override
  Widget build(BuildContext context) {
    List<DataRow> list = [
      for (var i = 0; i < 30; i++)
        DataRow(
          color: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (i % 2 == 0)
              return Colors.grey[200];
            return null; // Use the default value.
          }),
          cells: <DataCell>[
            DataCell(Text('Akshay$i')),
            DataCell(Text('25')),
            DataCell(Text('Software Developer')),
            DataCell(Text('20')),
            DataCell(Text('Software ')),
            DataCell(
              IconButton(
                onPressed: (){
                  print(i);
                },
                icon: Icon(Icons.add),
              )
            ),
          ],
        ),
    ];

    return SingleChildScrollView(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Age',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Designation',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'numner',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'dedjbwe',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'ACTION',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: list,
          ),
        ),
      ),
    );
  }
}
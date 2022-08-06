import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: search(),
    debugShowCheckedModeBanner: false,
  ));
}

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  List<String> list = [
    'Ahmedabad',
    'Surat',
    'Mumbai',
    'Delhi',
    'Vapi',
    'Agra',
    'Bharuch',
    'Jamnagar',
    'Rajkot',
    'Panchgini'
  ];
  List templist = [];
  bool search = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      templist = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search
          ? AppBar(
              title: TextField(
                onChanged: (value) {
                  print(value);
                  setState(() {
                    templist =
                        list.where((element) => element.contains(value)).toList();
                  });
                },
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        search = !search;
                      });
                    },
                    icon: Icon(Icons.cancel))
              ],
            )
          : AppBar(
              title: Text('City List'),backgroundColor: Colors.teal,
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        search = !search;
                      });
                    },
                    icon: Icon(Icons.search))
              ],
            ),
      body: ListView.builder(
        itemCount: templist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${templist[index]}'),
          );
        },
      ),
    );
  }
}

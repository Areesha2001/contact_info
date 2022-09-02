import 'package:contact_info/pages/details.dart';
import 'package:contact_info/utils/data_store.dart';
import 'package:flutter/material.dart';
import 'package:contact_info/model/info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  search(String query) {
    var searchlist = DataStore.info.where((element) {
      return element.name.toLowerCase().contains(query);
    }).toList();
    setState(() {
      DataStore.info = searchlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.purple,
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: DataStore.info.length,
                  itemBuilder: (context, index) {
                    Info info = DataStore.info[index];

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Details(info: info)));
                      },
                      onLongPress: () {
                        setState(() {
                          DataStore.info.removeAt(index);
                        });
                      },
                      child: Container(
                        height: 100.0,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.purple,
                                child: Text(
                                  info.letter,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      info.name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      info.number,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                PopupMenuButton(
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                      child: Text('Edit'),
                                    ),
                                    PopupMenuItem(
                                      child: Text('Delete'),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  width: 5,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.purple,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

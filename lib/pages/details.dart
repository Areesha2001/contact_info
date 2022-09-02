

import 'package:contact_info/model/info.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Info info;
  Details({required this.info});
  //const Details({Key? key}) : super(key: key);
  @override
  State<Details> createState() => _DetailsState();
}



class _DetailsState extends State<Details> {
  late final Info info;
  var size, height, width;
  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              color: Colors.purple,
              height: height / 2.5,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 150,
                    left: 10,
                    child: TextButton.icon(
                      onPressed: ()  {
                        Navigator.pushNamed(context, '/');
                      },

                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: Text(''),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 115,
                    child: Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.purple.shade400,
                        child: Text(
                          widget.info.letter,
                          style: const TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 95,
                    right: 58,
                    child: Text(
                      widget.info.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )),
          Card(
            child: ListTile(

              title: Text(widget.info.email),
              
              leading: Icon(
                Icons.mail,
              ),
            ),
          ),
          Card(
            child: ListTile(

              title: Text(widget.info.number),
              leading: Icon(
                Icons.phone,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

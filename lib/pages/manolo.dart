import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManoloPage extends StatefulWidget {
  @override
  _ManoloPageState createState() => _ManoloPageState();
}

class _ManoloPageState extends State<ManoloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 40,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0)
                      .copyWith(top: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('jose manuel zamora ortiz '),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Date of birth: 02/08/2020'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Gender: Female'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Email:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Email:'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topRight,
                  heightFactor: 6.0,
                  child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.only(
                      top: 5.0,
                      bottom: 5.0,
                      left: 4.0,
                      right: 8.0,
                    ),
                    child: Text(
                      '100% Match',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

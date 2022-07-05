import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String apidata = '';
void main() {
  runApp(MaterialApp(
    home: owner(),
  ));
}

class owner extends StatefulWidget {
  const owner({Key? key}) : super(key: key);

  @override
  _ownerState createState() => _ownerState();
}

class _ownerState extends State<owner> {
  Future<void> realallpost() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:8000/read_post_all'));

    apidata = response.body;
  }

  @override
  void initState() {
    realallpost();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " All Data",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xf4ffffff),
                    fontFamily: 'Playclub'),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 620,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white10,
                    ),
                    padding: EdgeInsets.only(
                        top: 30, left: 16, right: 16, bottom: 30),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        SelectableText(
                          "$apidata",
                          cursorColor: Colors.lightBlue,
                          showCursor: true,
                          toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                              cut: false,
                              paste: false),
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

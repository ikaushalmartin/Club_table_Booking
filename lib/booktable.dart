import 'package:flutter/material.dart';
import 'cons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: booktable(),
  ));
}

class booktable extends StatefulWidget {
  const booktable({Key? key}) : super(key: key);
  @override
  _booktableState createState() => _booktableState();
}

class _booktableState extends State<booktable> {
  late String clubid, name, number, seats, id;

  void add_data(
      String clubid1, String name1, String seats1, String number1) async {
    print(clubid1);
    print(name1);
    print(seats1);
    print(number1);
    var response =
        await http.post(Uri.parse('http://10.0.2.2:8000/add_post/'), body: {
      "clubid": "$clubid1".toUpperCase(),
      "name": "$name1".toUpperCase(),
      "seats": "$seats1".toUpperCase(),
      "number": "$number1".toUpperCase()
    });
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Data Sent Successfully! Wait For Confirmation"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("OOPs! Some Error Occured, Try Again Later"),
      ));
    }
    print(response.body);
  }

  void delete_data(String id1) async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:8000/delete_post/$id1'));
    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Your Entry Deleted Successfully"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("OOPs! Some Error Occured, Or Your Entry Doesn't Exist"),
      ));
    }
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black87,
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /*     Icon(
                    Icons.local_drink,
                    color: Colors.white,
                    size: 30,
                  ),
                  */
                  Container(
                    child: Text(
                      "Street Club",
                      style: TextStyle(
                          fontFamily: 'Shandora',
                          color: Color(0xf3ffffff),
                          fontSize: 35),
                    ),
                  ),
                  SizedBox(
                    width: 64,
                  ),
                  Text(
                    "Id - street384",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'good',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Flexible(
                child: Container(
                  height: 215,
                  child: SizedBox(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 27),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'Images/street1.jpg',
                            alignment: Alignment.center,
                            scale: 3.5,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://10619-2.s.cdn12.com/rests/original/348_509930247.jpg',
                            alignment: Alignment.center,
                            scale: 3.5,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),

                          /*Image.network(

                          ),*/
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://img.restaurantguru.com/r1ec-Street-Club-Live-Music-and-Bar-meals.jpg',
                            alignment: Alignment.center,
                            scale: 3.5,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              );
                            },
                          ),

                          /*Image.network(

                          ),*/
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://10619-2.s.cdn12.com/rests/original/348_509930257.jpg',
                            alignment: Alignment.center,
                            scale: 3.5,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              );
                            },
                          ),

                          /*Image.network(

                          ),*/
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),

              Text(
                "Details",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xf4ffffff),
                    fontFamily: 'Playclub'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 18),
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 280,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                          onChanged: (value) {
                            clubid = value;
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Enter Club ID",
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          onChanged: (value) {
                            name = value;
                          },
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: "Enter Your Name")),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          onChanged: (value) {
                            seats = value;
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: "Enter Number Of Seats")),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          onChanged: (value) {
                            number = value;
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: "Enter Your Mobile Number")),
                    ],
                  ),
                ),
              ), // regestration
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        print(clubid);
                        print(name);
                        print(seats);
                        print(number);
                        add_data(clubid, name, seats, number);
                      },
                      color: Color(0xff19A02E),
                      minWidth: 160,
                      height: 40,
                      child: Text(
                        'Book',
                        style: TextStyle(
                            color: Colors.white70, fontFamily: 'Playclub'),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text('Cancle Booking'),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Enter Your ID',
                                            icon: Icon(Icons.file_copy),
                                          ),
                                          onChanged: (value) {
                                            id = value;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  Center(
                                    child: FlatButton(
                                        child: Text("Cancle"),
                                        onPressed: () {
                                          delete_data(id);
                                        }),
                                  )
                                ],
                              );
                            });
                      },
                      color: Color(0xffA10035),
                      minWidth: 160,
                      height: 40,
                      child: Text(
                        'Cancle',
                        style: TextStyle(
                            color: Colors.white70, fontFamily: 'Playclub'),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

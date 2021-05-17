import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/theme/colors.dart';
import 'package:todo_app/model/to_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: custombackGroundColor,
        scaffoldBackgroundColor: customScaffoldbackGroundColor,
        primarySwatch: primaryColor,
      ),
      home: MyhomePage(),
    );
  }
}

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

// Keep track of todo lists
  List<Todo> todos = [];

  void _showInputFieldWidget(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => SimpleDialog(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                title: Text(
                  "Create a Todo List",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                children: [
                  const SizedBox(height: 24),
                  TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Example finish up assessment",
                        hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: desController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "What is your TODO for",
                        hintStyle: GoogleFonts.lateef(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty &&
                          desController.text.isNotEmpty) {
                        setState(() {
                          todos.add(Todo(
                              title: titleController.text,
                              description: desController.text,
                              dateTime: DateTime.now()));
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: Text("SAVE",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 20),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //MediaQuery helps get the size of device to aid display
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: custombackGroundColor,
          leading: IconButton(
            icon: Icon(Icons.menu_outlined),
            color: Colors.white,
            iconSize: 35,
            onPressed: () {},
          ),
          title: Text("My Todos",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white)),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                iconSize: 35,
                padding: EdgeInsets.symmetric(vertical: 4),
                onPressed: () {}),
          ],
        ),
        body: Column(children: [
          Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Text(
                "Welcome back,Mr Lasbrey",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )),
          Container(
            color: custombackGroundColor,
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            child: Image(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1575680841437-a429bf58c2ad?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGltYWdlcyUyMHdpdGglMjB0ZXh0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
            ),
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500,
                          height: 3,
                        ),
                        Container(
                            height: 25,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff00A925))),
                              child: Text("Ongoing",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                  )),
                            )),
                        SizedBox(
                          height: 100,
                          child: ListView(
                              padding: EdgeInsets.all(8.0),
                              children: <Widget>[
                                Container(
                                    width: double.infinity,
                                    height: 50,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    child: Row(children: <Widget>[
                                      Icon(
                                        Icons.trip_origin_rounded,
                                        color: Color(0xffED4C1A),
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Text("Pay Rent",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 67.0),
                                        child: Text("Sun, 17th",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ])),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 18),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.trip_origin_rounded,
                                        color: Color(0xffED4C1A),
                                        size: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Card(
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                      Container(
                                                        height: 200,
                                                        child: Row(children: [
                                                          IconButton(
                                                            alignment:
                                                                AlignmentDirectional
                                                                    .topEnd,
                                                            icon: Icon(
                                                                Icons.close),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                          Container(
                                                            height: 60,
                                                            width: 8,
                                                            color: Colors.red,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        12.0),
                                                                child: Text(
                                                                    "Go to the Mall",
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            27)),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  RichText(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    text: TextSpan(
                                                                        text:
                                                                            "Date:   ",
                                                                        style: GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: Colors.green,
                                                                            fontSize: 18),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: "Mon,17th",
                                                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18)),
                                                                        ]),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ]),
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Description",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .green,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            18)),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          50.0),
                                                                  child: Text(
                                                                      "to be completed",
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .red,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              12)),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ]));
                                              });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text("Go To The Mall",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: Text("Sun, 17th",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ])))
        ]));
  }
}

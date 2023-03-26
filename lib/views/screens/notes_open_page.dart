import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';



class Notes_Open_page extends StatefulWidget {
  const Notes_Open_page({Key? key}) : super(key: key);

  @override
  State<Notes_Open_page> createState() => _Notes_Open_pageState();
}

class _Notes_Open_pageState extends State<Notes_Open_page> {


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> detail =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new),color: Colors.black,),
        actions: [
          IconButton(
            onPressed: () async {
              await Share.share(
                  "-------------Notes-------------\Author : ${detail['author']}\n------------------------------------\nBook : ${detail['book']}"
              );
            },
            icon: const Icon(
              Icons.share_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          "Notes",
          style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Card(
              elevation: 5,
              shadowColor: Colors.blue[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    // height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        color: Colors.blue[900]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 11, top: 11),
                      child: Column(
                        children: [
                          Text("Book Name",style: TextStyle(color: Colors.yellow),),
                          Text(
                            "${detail['book']}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(15)),
                              color: Colors.blue[200],
                              child: Container(
                                height: 200,
                                width: 150,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: MemoryImage(
                                      base64Decode(
                                          "${detail["image"]}"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // height: 150,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text("Author Name",style: TextStyle(color: Colors.yellow[700]),),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 15),
                          child: Text("- ${detail['author']}",style: TextStyle(color: Colors.blue[800],fontSize: 18),),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







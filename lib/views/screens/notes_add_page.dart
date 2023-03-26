// import 'package:flutter/material.dart';
//
// import '../../helper_class/firebase_firestore_DB_helper.dart';
//
//
// class Add_note extends StatefulWidget {
//   const Add_note({Key? key}) : super(key: key);
//
//   @override
//   State<Add_note> createState() => _Add_noteState();
// }
//
// class _Add_noteState extends State<Add_note> {
//   String? title;
//   String? note;
//
//   TextEditingController titlecontroller = TextEditingController();
//   TextEditingController notecontroller = TextEditingController();
//
//   GlobalKey<FormState> imsertformKey = GlobalKey<FormState>();
//
//   String date = DateTime.now().toString().split(" ")[0];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Form(
//               key: imsertformKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text("${date}"),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0,right: 8),
//                     child: Card(
//                       elevation: 5,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       child: TextFormField(
//                         controller: titlecontroller,
//                         style: TextStyle(color: Colors.white),
//                         textInputAction: TextInputAction.next,
//                         validator: (val) {
//                           if (val!.isEmpty) {
//                             return "Enter title...";
//                           }
//                         },
//                         onSaved: (val) {
//                           setState(() {
//                             title = val;
//                           });
//                         },
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                               borderRadius: BorderRadius.circular(20),
//                         ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintText: "Title",
//                             hintStyle:
//                                 TextStyle(color: Colors.grey[400], fontSize: 21),
//                             filled: true,
//                             fillColor: Colors.black,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide.none,
//                             )),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10),
//                     child: Card(
//                       elevation: 5,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       child: TextFormField(
//                         maxLines: 30,
//                         controller: notecontroller,
//                         style: TextStyle(color: Colors.white),
//                         textInputAction: TextInputAction.next,
//                         validator: (val) {
//                           if (val!.isEmpty) {
//                             return "Enter note...";
//                           }
//                         },
//                         onSaved: (val) {
//                           setState(() {
//                             note = val;
//                           });
//                           print(note);
//                         },
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintText: "Notes",
//                             hintStyle:
//                                 TextStyle(color: Colors.grey[400], fontSize: 21),
//                             filled: true,
//                             fillColor: Colors.black,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               // borderSide: BorderSide.none,
//                             )),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 2,),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(left: 25.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 40,
//               child: FloatingActionButton.extended(
//                 onPressed: () {
//                   titlecontroller.clear();
//                   notecontroller.clear();
//
//                   setState(() {
//                     title = null;
//                     note = null;
//                   });
//
//                   Navigator.pop(context);
//                 },
//                 label: Text("Cancel"),),
//             ),
//
//             SizedBox(width: 15,),
//
//             Container(
//               height: 40,
//               child: FloatingActionButton.extended(
//                 label: Text("Insert"),
//                 onPressed: () async {
//                   if (imsertformKey.currentState!.validate()) {
//                     imsertformKey.currentState!.save();
//
//                     Map<String, dynamic> data = {
//                       'title': title,
//                       'note': note,
//                       'date': date,
//                     };
//
//                     await FirestoreDBHelper.firestoreDBHelper.insert(data: data);
//                     Navigator.of(context).pop();
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("Record inserted successfully..."),
//                         backgroundColor: Colors.green,
//                         behavior: SnackBarBehavior.floating,
//                       ),
//                     );
//                     print("validate successfully...");
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("Record insertion failed"),
//                         backgroundColor: Colors.red,
//                         behavior: SnackBarBehavior.floating,
//                       ),
//                     );
//                   }
//
//                   titlecontroller.clear();
//                   notecontroller.clear();
//
//                   setState(() {
//                     title = null;
//                     note = null;
//                     // image = null;
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

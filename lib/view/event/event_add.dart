import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/firebse_constant.dart';
import '../../core/globel_variable.dart';
import '../../model/event_model.dart';
class PostUploding extends StatefulWidget {
  const PostUploding({super.key});

  @override
  State<PostUploding> createState() => _PostUplodingState();
}

class _PostUplodingState extends State<PostUploding> {

  TextEditingController text=TextEditingController();
  var addpost;
  update({required ImageSource media}) async {

    ImagePicker imagePicker=ImagePicker();
    XFile? file=await imagePicker.pickImage(source: media);
    var ref=FirebaseStorage.instance.ref().child("kassim/image-${DateTime.now()}");
    UploadTask uploadTask =ref.putFile(File(file!.path));
    uploadTask.then((p0) async =>
    addpost= (await ref.getDownloadURL()).toString()).then((value) {
      print(addpost);
      setState(() {
      });
    });
    // var image=await ref.getDownloadURL();
    // print("====================================================$image");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text("Add post"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Center(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                     width: double.infinity,
                     height: 200,
        
                     decoration: BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.circular(10),
                         image: DecorationImage(
                             image: NetworkImage(addpost??""),fit: BoxFit.cover)),
                   ),
                   SizedBox(height: 15,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         width: 50,
                         height: 50,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(10)
                         ),
                         // child: Image(image: NetworkImage("https://icons.iconarchive.com/icons/iconarchive/outline-camera/512/Flat-Red-Big-Camera-icon.png"),),
                         child: GestureDetector(
                             onTap: (){
                               update(media: ImageSource.camera);
                             },
                             child:  Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxbVT96botqSb2PCUzGNur5mPCaKNsT0TbyA&usqp=CAU"),fit: BoxFit.cover,)),
                       ),
                       SizedBox(width: 15,),
                       Container(
                         width: 50,
                         height: 50,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child:  GestureDetector(
                             onTap: (){
                               update(media: ImageSource.gallery);
                             },
                             child:  Image(image: AssetImage("assets/images/gellery.png"), fit: BoxFit.cover,)),
                         // child: Image(image: NetworkImage("https://icon-library.com/images/gallery-icon/gallery-icon-17.jpg"),),
                       ),
                     ],
                   ),
                   SizedBox(height: 15,),
                   Container(
                     width: double.infinity,
                     height: 130,
                     decoration: BoxDecoration(
                         color: Colors.grey,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           Text("Add Titile ",style: TextStyle(color: Colors.black),),
                           TextFormField(
                             controller: text,
                           )
                         ],
                       ),
                     ),
                   ),
                   SizedBox(height: 15,),
                   InkWell(
                     onTap: (){
                       var post=EventModel(
                         // clubName:currentuser!.clubName,
                           postDescription:text.text,
                           likesList:[],
                           postUrl: addpost,
                           uploadedTime:DateTime.now());
                     },
                     child: Container(
                       width: double.infinity,
                       height: 70,
                       decoration: BoxDecoration(
                           color: Colors.blue.shade900,
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child: InkWell(
                         onTap: () async {
                           var p = EventModel(
                             postDescription: text.text,
                             likesList: [],
                             postUrl: addpost,
                             uploadedTime: DateTime.now(),
                           );
                           eventModel = p;
                           await FirebaseFirestore.instance
                               .collection('posts') // Directly accessing the 'posts' collection
                               .add(p.toJson())
                               .then((value) async {
                             var data = await value.get();
                             var ref = data.reference;
                             var a = eventModel?.copyWith(
                               postId: value.id,
                               postRef: ref,
                             );

                             print('ref=$ref');
                             await ref.update(a!.toJson());
                           });
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                             content: Text("Successfully uploaded"),
                           ));
                         },
                         child: Center(
                           child: Text(
                             "Upload Post",
                             style: TextStyle(color: Colors.white),
                           ),
                         ),
                       ),

                     ),
                   ),
                 ],
               ),
             ),
           ),
         ],
        ),
      ),
    )
    );
  }
}

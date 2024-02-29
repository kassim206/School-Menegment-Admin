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
      backgroundColor: Colors.white,
      body: Stack(
       children: [
         Image(
           image: NetworkImage(
               'https://png.pngtree.com/thumb_back/fh260/background/20220522/pngtree-abstract-white-and-light-'
                   'gray-wave-modern-soft-luxury-texture-with-image_1379862.jpg'
           ),
           fit: BoxFit.cover,
           width: double.infinity, // Adjust width as needed
           height: double.infinity, // Adjust height as needed
         ),
         Center(
           child: Container(
             width: w*0.45,
             height: h*0.8,
             decoration: BoxDecoration(
               // color: Colors.blue,
               borderRadius: BorderRadius.circular(20),
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Container(
                   width: w*0.3,
                   height: h*0.25,
                   decoration: BoxDecoration(
                       color: Colors.black,
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                           image: NetworkImage(addpost??""),fit: BoxFit.cover)),
                 ),
                 // Container(
                 //   width: w*0.07,
                 //   height: h*0.07,
                 //   decoration: BoxDecoration(
                 //       color: Colors.white,
                 //       borderRadius: BorderRadius.circular(10)
                 //   ),
                 //   // child: Image(image: NetworkImage("https://icons.iconarchive.com/icons/iconarchive/outline-camera/512/Flat-Red-Big-Camera-icon.png"),),
                 //   child: GestureDetector(
                 //       onTap: (){
                 //         update(media: ImageSource.camera);
                 //       },
                 //       child:  Image(image: NetworkImage("https://icons.iconarchive.com/icons/iconarchive/outline-camera/512/Flat-Red-Big-Camera-icon.png"),)),
                 // ),
                 Container(
                   width: w*0.07,
                   height: h*0.07,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child: GestureDetector(
                       onTap: (){
                         update(media: ImageSource.gallery);
                       },
                       child:  Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:"
                           "ANd9GcRpDoDo1TLx0OcwuxRRUsVJ5qmICY-wM7NZQA&usqp=CAU"),
                         fit: BoxFit.cover,)),
                   // child: Image(image: NetworkImage("https://icon-library.com/images/gallery-icon/gallery-icon-17.jpg"),),
                 ),
                 Container(
                   width: w*0.3,
                   height: h*0.2,
                   decoration: BoxDecoration(
                       color: Colors.grey,
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         Text("Description",style: TextStyle(color: Colors.black),),
                         TextFormField(
                           controller: text,
                         )
                       ],
                     ),
                   ),

                 ),
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
                     width: w*.250,
                     height: h*.100,
                     decoration: BoxDecoration(
                         color: Colors.blue.shade900,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: InkWell(onTap:
                         () async {
                       var p =EventModel(
                           // clubName: eventModel!.clubName,
                           postDescription: text.text,
                           likesList:[],
                           postUrl: addpost,
                           uploadedTime: DateTime.now());
                       eventModel =p;
                       await  FirebaseFirestore.instance
                           .collection(Firebaseconstant.user)
                           .doc()
                           .collection('posts')
                           .add(p.toJson()).then((value) async {
                         var data =await value.get();
                         var ref = data.reference;
                         var a=eventModel?.copyWith(
                             postId: value.id,
                             postRef: ref
                         );

                         print('ref=$ref');
                         await  ref.update(a!.toJson());
                       });
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(" successfully uploaded")));

                     },
                         child: Center(child: Text("upload post",style: TextStyle(color: Colors.white,),))),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
      ),
    )
    );
  }
}

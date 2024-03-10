// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sidebarx/sidebarx.dart';
//
// import '../../../core/globel_variable.dart';
// import '../../course/course.dart';
// import '../../event/event_add.dart';
// import '../../event/event_count.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// const primaryColor = Color(0xFF6252DA);
// const canvasColor = Color(0xFF2E2E48);
// const scaffoldBackgroundColor = Color(0xFF7777B6);
//
// class _MyHomePageState extends State<MyHomePage> {
//   final _controller = SidebarXController(selectedIndex: 0, extended: true);
//   final _key = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Builder(
//           builder: (context) {
//             final isSmallScreen = MediaQuery.of(context).size.width < 600;
//             return Scaffold(
//                 // key: _key,
//                 // appBar: isSmallScreen ? AppBar(
//                 //   leading: IconButton(
//                 //     onPressed: (){
//                 //       _key.currentState?.openDrawer();
//                 //     },
//                 //     icon: Icon(Icons.menu),
//                 //   ),
//                 // ): null,
//                 // drawer: SideBarXExample(controller: _controller,),
//                 body: Stack(
//                   children: [
//                Image(
//                  image: NetworkImage(
//                      'https://png.pngtree.com/thumb_back/fh260/background/20220522/pngtree-abstract-white-and-light-'
//                          'gray-wave-modern-soft-luxury-texture-with-image_1379862.jpg'
//                  ),
//                  fit: BoxFit.cover,
//                  width: double.infinity, // Adjust width as needed
//                  height: double.infinity, // Adjust height as needed
//                ),
//               // Row(
//               //   children: [
//               //     if(!isSmallScreen) SideBarXExample(controller: _controller),
//               //   ],
//               // ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 70),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Wrap(
//                         children: [
//                           EventCount(),
//
//                           CourseCount(),
//
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Container(
//                           //     width: h*0.3,
//                           //     height: h*0.22,
//                           //     decoration: BoxDecoration(
//                           //         color: Colors.white,
//                           //         gradient: LinearGradient(
//                           //             colors: [
//                           //               Theme.of(context).colorScheme.onSecondary,
//                           //               Theme.of(context).colorScheme.primaryContainer,
//                           //               Theme.of(context).colorScheme.primaryContainer,
//                           //               // Theme.of(context).colorScheme.primary,
//                           //             ],
//                           //             transform: const GradientRotation(pi /4 )
//                           //         ),
//                           //         borderRadius: BorderRadius.circular(20),
//                           //         boxShadow:[
//                           //           BoxShadow(
//                           //               blurRadius: 2,
//                           //               spreadRadius: 0,
//                           //               color: Colors.grey.shade500,
//                           //               offset: Offset(5, 5)
//                           //           ),
//                           //         ]
//                           //     ),
//                           //     child: Center(child: Column(
//                           //       mainAxisAlignment: MainAxisAlignment.center,
//                           //       children: [
//                           //         Text("0",style:
//                           //         TextStyle(fontWeight: FontWeight.bold,
//                           //             color: Colors.black,fontSize: 50),),
//                           //         Text("Count",style:
//                           //         TextStyle(fontWeight: FontWeight.bold,
//                           //           color: Colors.black,),),
//                           //       ],
//                           //     )),
//                           //   ),
//                           // ),
//
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Container(
//                           //     width: h*0.3,
//                           //     height: h*0.22,
//                           //     decoration: BoxDecoration(
//                           //         color: Colors.white,
//                           //         gradient: LinearGradient(
//                           //             colors: [
//                           //               Theme.of(context).colorScheme.onSecondary,
//                           //               Theme.of(context).colorScheme.primaryContainer,
//                           //               Theme.of(context).colorScheme.primaryContainer,
//                           //               // Theme.of(context).colorScheme.primary,
//                           //             ],
//                           //             transform: const GradientRotation(pi /4 )
//                           //         ),
//                           //         borderRadius: BorderRadius.circular(20),
//                           //         boxShadow:[
//                           //           BoxShadow(
//                           //               blurRadius: 2,
//                           //               spreadRadius: 0,
//                           //               color: Colors.grey.shade500,
//                           //               offset: Offset(5, 5)
//                           //           ),
//                           //         ]
//                           //     ),
//                           //     child: Center(child: Column(
//                           //       mainAxisAlignment: MainAxisAlignment.center,
//                           //       children: [
//                           //         Text("0",style:
//                           //         TextStyle(fontWeight: FontWeight.bold,
//                           //             color: Colors.black,fontSize: 50),),
//                           //         Text("Count",style:
//                           //         TextStyle(fontWeight: FontWeight.bold,
//                           //           color: Colors.black,),),
//                           //       ],
//                           //     )),
//                           //   ),
//                           // ),
//
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Container(
//                           //     width: h*0.3,
//                           //     height: h*0.22,
//                           //     decoration: BoxDecoration(
//                           //         color: Colors.white,
//                           //         gradient: LinearGradient(
//                           //             colors: [
//                           //               Theme.of(context).colorScheme.onSecondary,
//                           //               Theme.of(context).colorScheme.primaryContainer,
//                           //               Theme.of(context).colorScheme.primaryContainer,
//                           //               // Theme.of(context).colorScheme.primary,
//                           //             ],
//                           //             transform: const GradientRotation(pi /4 )
//                           //         ),
//                           //         borderRadius: BorderRadius.circular(20),
//                           //         boxShadow:[
//                           //           BoxShadow(
//                           //               blurRadius: 2,
//                           //               spreadRadius: 0,
//                           //               color: Colors.grey.shade500,
//                           //               offset: Offset(5, 5)
//                           //           ),
//                           //         ]
//                           //     ),
//                           //     child: Center(child: Column(
//                           //       mainAxisAlignment: MainAxisAlignment.center,
//                           //       children: [
//                           //         Text("0",style:
//                           //         TextStyle(fontWeight: FontWeight.bold,
//                           //             color: Colors.black,fontSize: 50),),
//                           //         Text("Count",style:
//                           //         TextStyle(fontWeight: FontWeight.bold,
//                           //           color: Colors.black,),),
//                           //       ],
//                           //     )),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       Wrap(
//                         children: [
//                           GestureDetector(
//                             onTap: (){
//                               Navigator.push(context, MaterialPageRoute(builder: (context) => PostUploding(),));
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 width: h*0.3,
//                                 height: h*0.25,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     // gradient: LinearGradient(
//                                     //     colors: [
//                                     //       Theme.of(context).colorScheme.onSecondary,
//                                     //       Theme.of(context).colorScheme.primaryContainer,
//                                     //       Theme.of(context).colorScheme.primaryContainer,
//                                     //       // Theme.of(context).colorScheme.primary,
//                                     //     ],
//                                     //     transform: const GradientRotation(pi /4 )
//                                     // ),
//                                     borderRadius: BorderRadius.circular(20),
//                                     boxShadow:[
//                                       BoxShadow(
//                                           blurRadius: 2,
//                                           spreadRadius: 0,
//                                           color: Colors.grey.shade500,
//                                           offset: Offset(5, 5)
//                                       ),
//                                     ]
//                                 ),
//                                 child: Center(child: Text("Add Events",style:
//                                 TextStyle(fontWeight: FontWeight.bold,
//                                     color: Colors.black),)),
//                               ),
//                             ),
//                           ),
//                           Course(),
//
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Container(
//                           //     width: h*0.3,
//                           //     height: h*0.25,
//                           //     decoration: BoxDecoration(
//                           //         color: Colors.white,
//                           //         // gradient: LinearGradient(
//                           //         //     colors: [
//                           //         //       Theme.of(context).colorScheme.onSecondary,
//                           //         //       Theme.of(context).colorScheme.primaryContainer,
//                           //         //       Theme.of(context).colorScheme.primaryContainer,
//                           //         //       // Theme.of(context).colorScheme.primary,
//                           //         //     ],
//                           //         //     transform: const GradientRotation(pi /4 )
//                           //         // ),
//                           //         borderRadius: BorderRadius.circular(20),
//                           //         boxShadow:[
//                           //           BoxShadow(
//                           //               blurRadius: 2,
//                           //               spreadRadius: 0,
//                           //               color: Colors.grey.shade500,
//                           //               offset: Offset(5, 5)
//                           //           ),
//                           //         ]
//                           //     ),
//                           //     child: Center(child: Text("Add Nots",style:
//                           //     TextStyle(fontWeight: FontWeight.bold,
//                           //         color: Colors.black),)),
//                           //   ),
//                           // ),
//                           //
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Container(
//                           //     width: h*0.3,
//                           //     height: h*0.25,
//                           //     decoration: BoxDecoration(
//                           //         color: Colors.white,
//                           //         // gradient: LinearGradient(
//                           //         //     colors: [
//                           //         //       Theme.of(context).colorScheme.onSecondary,
//                           //         //       Theme.of(context).colorScheme.primaryContainer,
//                           //         //       Theme.of(context).colorScheme.primaryContainer,
//                           //         //       // Theme.of(context).colorScheme.primary,
//                           //         //     ],
//                           //         //     transform: const GradientRotation(pi /4 )
//                           //         // ),
//                           //         borderRadius: BorderRadius.circular(20),
//                           //         boxShadow:[
//                           //           BoxShadow(
//                           //               blurRadius: 2,
//                           //               spreadRadius: 0,
//                           //               color: Colors.grey.shade500,
//                           //               offset: Offset(5, 5)
//                           //           ),
//                           //         ]
//                           //     ),
//                           //     child: Center(child: Text("View Club\nJoin Students",style:
//                           //     TextStyle(fontWeight: FontWeight.bold,
//                           //         color: Colors.black),)),
//                           //   ),
//                           // ),
//                           //
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Expanded(
//                           //     child: Container(
//                           //       width: h*0.3,
//                           //       height: h*0.25,
//                           //       decoration: BoxDecoration(
//                           //           color: Colors.white,
//                           //           // gradient: LinearGradient(
//                           //           //     colors: [
//                           //           //       Theme.of(context).colorScheme.onSecondary,
//                           //           //       Theme.of(context).colorScheme.primaryContainer,
//                           //           //       Theme.of(context).colorScheme.primaryContainer,
//                           //           //       // Theme.of(context).colorScheme.primary,
//                           //           //     ],
//                           //           //     transform: const GradientRotation(pi /4 )
//                           //           // ),
//                           //           borderRadius: BorderRadius.circular(20),
//                           //           boxShadow:[
//                           //             BoxShadow(
//                           //                 blurRadius: 2,
//                           //                 spreadRadius: 0,
//                           //                 color: Colors.grey.shade500,
//                           //                 offset: Offset(5, 5)
//                           //             ),
//                           //           ]
//                           //       ),
//                           //       child: Center(child: Text("View",style:
//                           //       TextStyle(fontWeight: FontWeight.bold,
//                           //           color: Colors.black),)),
//                           //     ),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//                   ],
//                 )
//             );
//           }
//       ),
//     );
//   }
// }
// //
// // class SideBarXExample extends StatelessWidget {
// // const SideBarXExample({Key? key, required SidebarXController controller}) : _controller = controller,super(key: key);
// // final SidebarXController _controller;
// // @override
// // Widget build(BuildContext context) {
// // return SidebarX(
// // controller: _controller,
// // theme:  const SidebarXTheme(
// // decoration: BoxDecoration(
// // color: canvasColor,
// // borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
// // ),
// // iconTheme: IconThemeData(
// // color: Colors.white,
// // ),
// // selectedTextStyle: const TextStyle(color: Colors.white),
// // ),
// // extendedTheme: const SidebarXTheme(
// // width: 250
// // ),
// //
// // footerDivider: Divider(color:  Colors.white.withOpacity(0.8), height: 1),
// // headerBuilder: (context,extended){
// // return const  SizedBox(
// // height: 100,
// // child: Icon(Icons.person,size: 60,color: Colors.white,),
// // );
// // },
// //
// // items: const [
// // SidebarXItem(icon: Icons.home, label: 'Home',),
// // SidebarXItem(icon: Icons.search, label: 'Search'),
// // SidebarXItem(icon: Icons.settings, label: 'Setting'),
// // SidebarXItem(icon: Icons.event_available, label: 'Club'),
// // ],
// // );
// // }
// // }
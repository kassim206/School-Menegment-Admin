import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        title: Text("Events"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
              if (data == null) return SizedBox(); // Skip if data is null
              String postDescription = data['description'] ?? ''; // Use empty string if postDescription is null
              String postUrl = data['postUrl'] ?? ''; // Use empty string if postUrl is null
              print("${postUrl}###################");
              return Dismissible(
                key: Key(document.id),
                onDismissed: (direction) {
                  FirebaseFirestore.instance.collection('posts').doc(document.id).delete();
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postDescription,
                        maxLines: 2, // Adjust maxLines as per your UI requirements
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      ),
                      SizedBox(height: 8.0),
                      if (postUrl.isNotEmpty) Image.network(
                        width: 300,
                        postUrl,
                        fit: BoxFit.fill,

                      ), // Display image if postUrl is not empty
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

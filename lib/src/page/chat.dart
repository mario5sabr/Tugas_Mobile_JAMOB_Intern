import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internmobile/src/helper/firebaseHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ChatTxt extends StatefulWidget {
  @override
  State<ChatTxt> createState() => _ChatTxtState();
}

class _ChatTxtState extends State<ChatTxt> {
  Service service = Service();

  final storeMessage = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController msg = TextEditingController();

  //untuk user sekarang
  getCurrentUser() async {
    final user = auth.currentUser;
    //pas user tidak kosong akan assign ke login pengguna
    if (user != null) {
      loginUser = user;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                service.signOut(context);
                //disini akan hapus email dari key ketika user sign out
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove('email');
                //akan hapus user email ketika user klik logout
              },
              icon: Icon(Icons.logout))
        ],
        title: Text(loginUser!.email.toString()),
      ),
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //nampilin pesan
              Container(
                  height: 500,
                  child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      reverse: true,
                      child: TampilPesan())),
              Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Colors.amberAccent, width: 0.2))),
                    child: Container(
                      child: TextField(
                        controller: msg,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Enter a message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.amberAccent),
                  onPressed: () {
                    if (msg.text.isNotEmpty) {
                      storeMessage.collection("Messages").doc().set({
                        "messages": msg.text.trim(),
                        "user": loginUser!.email.toString(),
                        "time": DateTime.now().toString()
                      });
                      msg.clear();
                    }
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class TampilPesan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Messages")
          .orderBy("time")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            primary: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, e) {
              QueryDocumentSnapshot x = snapshot.data!.docs[e];
              return ListTile(
                  title: Column(
                //kalau penggunanya sendiri text akan tampil di end
                //sebaliknya kalau lawan bicara akan ada di start
                crossAxisAlignment: loginUser!.email == x['user']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: loginUser!.email == x['user']
                          ? Colors.orange[200]
                          : Colors.blue[200],
                      child: Column(
                        children: [
                          Text(x['messages']),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "user: " + x['user'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ))
                ],
              )
                  //kalau user yang chat kita sendiri tampilan textnnya di end
                  //klau gak sebaliknya di start
                  );
            });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testedio/app/models/usermodel.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.pTMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.getData,
        child: Observer(builder: (_) {
          if (controller.data == null) {
            controller.getData();
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  List<UserModel> user = controller.data;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(user[index].picture.thumbnail),
                    ),
                    title: Text(
                        '${user[index].name.first} ${user[index].name.last}'),
                    subtitle: Text(user[index].email),
                    trailing: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                  );
                });
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          controller.getData();
        },
      ),
    );
  }
}

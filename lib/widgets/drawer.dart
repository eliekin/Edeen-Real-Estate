import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproprety/screens/login_screen.dart';


class DrawerEdited extends StatelessWidget {
  const DrawerEdited({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        child: Drawer(
          child: Column(
            children:[
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height /5, left: MediaQuery.of(context).size.width/60),
                child: GestureDetector(
                  onTap: () async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app_rounded, color: Colors.blue,),
                      SizedBox(width: 2,),
                      Text('Sign Out', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                      
                    ],
                  ),
                ),
              )
              ],
          ),
        ),
      );
  }
}

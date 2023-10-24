import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('images/bulding.jpg',width:
                  MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.6,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('News from around the \n   word for you',
            style: TextStyle(color: Colors.black,
            fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
                height: 20),
            Text('Best time to read take your time to read\n           a little more of this Word',
              style: TextStyle(color: Colors.black45,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40.0,),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text("Get Started" ,style: TextStyle(fontSize: 17,color: Colors.white,
                      fontWeight: FontWeight.w500,
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

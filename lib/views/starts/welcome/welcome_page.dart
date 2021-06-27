import 'package:dictionary_personalization/common/utilities/colors.dart';
import 'package:dictionary_personalization/routes/routes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Cùng khám phá thế giới với chúng mình nhé !",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorConstant.backgroundTwoColor,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              height: 270,
              //child: Image.asset("images/aventure.png"),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  "images/aventure.png",
                  // width: 300,
                  height: 240,
                  fit:BoxFit.fill,
                ),
              ),
            ),

            SizedBox(
              height: 60,
            ),

            Container(
              height: 48,
              width: double.infinity,
              child: TextButton(
                child: Text("Đăng nhập / Đăng ký", style: TextStyle(color: ColorConstant.buttonFiveColor)),
                onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //         return AuthPage();
                  //       }));
                  Navigator.pushNamed(context, Routes.auth);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: ColorConstant.buttonFiveColor)
                        )
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

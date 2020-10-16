import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopping_app/resources/resources.dart';
import 'package:shopping_app/widget/appbar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommonAppBar(title: 'Profile'),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: height * 0.3,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Huynh Cong Tien', style: headingTextWhite,),
                Text('congtien.iuh@gmail.com', style: whiteText,),
              ],
            ),
          ),
          Container(
            child: ListView.separated(
                shrinkWrap: true, // 1st add
                physics: ClampingScrollPhysics(), // 2nd add
                itemBuilder: (context, index) {
              return rowFeature();
            }, separatorBuilder: (BuildContext context, int index) => Divider(), itemCount: 10),
          )
        ],
      ),
    );
  }
  Widget rowFeature(){
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Orders', style: textMedium,),
            IconButton(icon: Icon(Ionicons.ios_arrow_forward), onPressed: (){})
          ],
        ),
      ),
    );
  }
}

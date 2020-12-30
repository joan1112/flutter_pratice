import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/discover_cell.dart';

class PersonOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                color: Color.fromRGBO(220, 220, 220, 1),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 200,
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.only(top: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/Hank.png'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Container(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'make',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '微信号：Joanbo9429',
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Image(
                                  image: AssetImage('images/icon_right.png'),
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DiscoverCell(title: "支付", imageName: "images/微信 支付.png"),
                      SizedBox(
                        height: 5,
                      ),
                      DiscoverCell(title: "收藏", imageName: "images/微信收藏.png"),
                      DiscoverCell(title: "相册", imageName: "images/微信相册.png"),
                      DiscoverCell(title: "卡包", imageName: "images/微信卡包.png"),
                      DiscoverCell(title: "表情", imageName: "images/微信表情.png"),
                      SizedBox(
                        height: 5,
                      ),
                      DiscoverCell(title: "设置", imageName: "images/微信设置.png"),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35, right: 10),
                height: 25,
                alignment: Alignment.centerRight,
                child: Image(image: AssetImage('images/相机.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_flutter/screens/intro/sub_onboarding/my_widget.dart';
import 'package:project_flutter/screens/intro/sub_onboarding/onboarding1.dart';


class OnBording1Screen extends StatefulWidget {
  const OnBording1Screen({super.key});

  @override
  State<OnBording1Screen> createState() => _OnBording1ScreenState();
}

class _OnBording1ScreenState extends State<OnBording1Screen> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();

  // PageController controller = PageController();
  // int selected_index = 0;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Column(
        children: [
        Expanded(
          child: TabBarView(
            controller: tabController,

            children: [
              OnBoarding1(image: 'images/job01.png', title: "Find a Perfect Job", subTitle1: "JobFinder help you find your", subTitle2: "job most easily."),
              OnBoarding1(image: 'images/job02.png', title: "Apply to Best Jobs", subTitle1: "You can apply to your desirable", subTitle2: "jobs, put your CV."),
              OnBoarding1(image: 'images/job03.png', title: "Get your Job", subTitle1: "Start working with your team in", subTitle2: "your new workplace."),
            ],
          ),

        ),

        TabPageSelector(color: Colors.black38,
            controller: tabController,
          ),

          SizedBox(height:10,),

        
      ],
      ),
    );
  }

}


          
          // PageView(
          //   controller: controller,
          //   onPageChanged: (value) {
          //     setState(() {
          //       selected_index = value;
          //     });
         
            
          
      

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     BuildCircleAvatar(0, selected_index),
        //     Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 10),
        //         child: BuildCircleAvatar(1, selected_index)),
        //     BuildCircleAvatar(2, selected_index)
        //   ],
        // ),


    
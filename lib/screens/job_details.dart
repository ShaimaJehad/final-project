import 'package:flutter/material.dart';
import 'package:project_flutter/screens/favourite_manager.dart';

class JobDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> job;

  JobDetailsScreen(this.job);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {

  bool isFavorite = false;


  @override
  void initState() {
    super.initState();
    FavoriteJobsManager.init().then((_) {
      setState(() {
        isFavorite = FavoriteJobsManager.isJobFavorite(widget.job);
      });
    });
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      FavoriteJobsManager.addFavoriteJob(widget.job);
    } else {
      FavoriteJobsManager.removeFavoriteJob(widget.job);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Stack(
            children: [


              Container(
                
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xff1599CE),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 26,
                              )),
                      
                              SizedBox(width: 18,),
                      
                              Text(
                            '${widget.job['name']}',
                            style: TextStyle(
                              fontFamily: "poppins",
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),

                      
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 26),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                    child: Image.network(
                                      '${widget.job['imageUrl']}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${widget.job['company']}',
                              style: TextStyle(
                                fontFamily: "poppins",
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                  onPressed: toggleFavorite,
                                  icon: Icon(
                                    isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 15,)
                      
                    ],
                  ),
                ),
              ),

            ]),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      widget.job['description'],
                      style: TextStyle(
                        fontFamily: "poppins",
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(height: 20),
                    Text(
                      'Requirements:',
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      widget.job['requirements'][0].toString(),
                      style: TextStyle(
                        fontFamily: "poppins",
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      widget.job['requirements'][1].toString(),
                      style: TextStyle(
                        fontFamily: "poppins",
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      widget.job['requirements'][2].toString(),
                      style: TextStyle(
                        fontFamily: "poppins",
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    
                    Text(
                'Detailes:',
                style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 10),

              Center(
                child: SizedBox(
                  width: 200,
                 
                  child: ListTile(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    tileColor: Colors.grey.shade100,
                   // contentPadding: EdgeInsets.all(5),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.price_change_rounded,
                        size: 30,
                        color: Color(0xff1599CE),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        widget.job['salary'],
                        style: TextStyle(
                          fontFamily: "poppins",
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),



              SizedBox(height: 10),



               Center(
                 child: SizedBox(
                      width: 200,
                     
                      child: ListTile(
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        tileColor: Colors.grey.shade100,
                       // contentPadding: EdgeInsets.all(5),
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.timer_rounded,
                            size: 30,
                            color: Color(0xff1599CE),
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            widget.job['years-experience'],
                            style: TextStyle(
                              fontFamily: "poppins",
                              color: Colors.grey.shade800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
               ),

               SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      shadowColor: Color(0xff000000),
                      backgroundColor: Color(0xff1599CE),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Apply",
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "manrope"),
                    ),
                  ),
                ),
              ),
                  ],
                ),
              ),


              
            ],
        
       
      ),
    );
  }
}







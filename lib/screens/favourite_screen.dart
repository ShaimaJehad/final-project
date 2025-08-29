import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_flutter/screens/favourite_manager.dart';
import 'package:project_flutter/screens/job_details.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

    List<Map<String, dynamic>> favoriteJobs = [];


    @override
  void initState() {
    super.initState();
    FavoriteJobsManager.init().then((_) {
      setState(() {
        favoriteJobs = FavoriteJobsManager.favoriteJobs;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: FavoriteJobsManager.favoriteJobs.length,
        itemBuilder: (context, index) {
          final job = FavoriteJobsManager.favoriteJobs[index];

          return ListTile(
            title: Text(job['name']),
            subtitle: Text(job['company']),
          );
        },
      ),
    );
  }
}
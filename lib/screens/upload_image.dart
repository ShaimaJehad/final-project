// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:project_flutter/screens/cloud_storage.dart';
// import 'package:project_flutter/screens/getImages.dart';


// class UploadImage extends StatefulWidget {
//   @override
//   State<UploadImage> createState() => _UploadImageState();
// }

// class _UploadImageState extends State<UploadImage> {
//   late ImagePicker picker;

//   XFile? file;

//   @override
//   void initState() {
//     picker = ImagePicker();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: (){
//            Get.to(()=>GetImages());
//           }, icon: Icon(Icons.camera))
//         ],
//       ),
//       body: Column(
//         children: [
//           file != null ? Image.file(File(file!.path),height: 200,width: 200,) : Image.asset("images/design.png",width: 200,height: 200,),
//           ElevatedButton(
//               onPressed: () async {
//                 file = await picker.pickImage(source: ImageSource.gallery);
//                 setState(() {
//                 });
//               },
//               child: Text("selectImage")),
//           ElevatedButton(onPressed: () {
//             cloudStorage().upload(fileName: file!.name/*DateTime.now().millisecond.toString()*/, file: File(file!.path));
//           }, child: Text("UploadImage")),
//         ],
//       ),
//     );
//   }
// }

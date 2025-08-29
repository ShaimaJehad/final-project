class MyUser {
  late String id;
  late String name;
  late String email;
  late String password;
  
  var profilePicture;

  MyUser(

  );


MyUser.user( {
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });
  
// بترجع ماب
// Convert MyUser object to a map

  toMap(){
    return {
      'name':this.name,
      'id':this.id,
      'email':this.email,
      'password':this.password
    };
  }



  // Create a new MyUser object from a map

  MyUser.fromMap(var map){
    this.password = map['password'];
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.profilePicture = map['profilePicture'];

  }
}


class JobModel {
  late String id;
  late String imageUrl;
  late String name;
  late String description;
  late String status;
  late bool isFavourite;
  
 

  JobModel();

  toMap(){
    return {
      'id': this.id,
      'name':this.name,
      'imageUrl':this.imageUrl,
      'description': this.description,
      'status' : this.status,
      'isFavourite': this.isFavourite
      
    };
  }

  JobModel.fromMap(var map){
    this.id= map['id'];
    this.name = map['name'];
    this.imageUrl = map['imageUrl'];
    this.description = map['description'];
    this.status  =map ['status'] ;
    this.isFavourite = false;
  }
}

import 'package:michis/src/features/domain/entities/breed_entity.dart';

class BreedModel extends BreedEntity {
  const BreedModel({
    String? id,
    String? name,
    String? description,
    String? origin,
    List<String>? temperaments,
    String? idImg
  }): super(
    id: id,
    name: name,
    description: description,
    origin: origin,
    temperaments: temperaments,
    idImg: idImg
  );


  factory BreedModel.fromJson(Map<String, dynamic> json){
    return BreedModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      origin: json['origin'],
      temperaments: json['temperament'] is String 
        ? List<String>.from((json['temperament'] as String).split(', '))
        : [],
      idImg: json['reference_image_id']
    );
  }
}
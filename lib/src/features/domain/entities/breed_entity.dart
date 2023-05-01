
import 'package:equatable/equatable.dart';

class BreedEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? origin;
  final List<String>? temperaments;
  final String? idImg;

  const BreedEntity({
    this.id,
    this.name,
    this.description,
    this.origin,
    this.temperaments,
    this.idImg
  });
  
  @override
  List<Object?> get props => [id, name, description, origin, temperaments, idImg];
}
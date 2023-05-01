import 'package:dartz/dartz.dart';
import 'package:michis/src/core/failures.dart';
import 'package:michis/src/features/domain/entities/breed_entity.dart';

abstract class CatsRepository {
  Future<Either<Failure, List<BreedEntity>>> getCats();
}
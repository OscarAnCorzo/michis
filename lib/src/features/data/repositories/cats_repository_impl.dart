import 'package:michis/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:michis/src/features/data/datasource/remote_datasource.dart';
import 'package:michis/src/features/domain/entities/breed_entity.dart';
import 'package:michis/src/features/domain/repositories/cats_repository.dart';

class CatsRepositoryImpl implements CatsRepository {
  final RemoteDataSource remoteDataSource;
  
  CatsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BreedEntity>>> getCats() async {
    try {
      final resp = await this.remoteDataSource.getCats();

      return Right(resp);
    } catch (e) {
      return Left(e is Failure ?e :DomainLayerFailure.fromError(e));
    }
  }

}
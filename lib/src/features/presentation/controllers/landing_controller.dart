import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:michis/src/core/utils/utils.dart';
import 'package:michis/src/features/domain/entities/breed_entity.dart';
import 'package:michis/src/features/domain/usecases/get_cats_usecase.dart';
import 'package:michis/src/features/presentation/views/detail_view.dart';

class LandingController extends GetxController {
  final GetCatsUseCase _getCatsUseCase;

  LandingController({
    required GetCatsUseCase getCatsUseCase
  }): _getCatsUseCase = getCatsUseCase;


  bool _loading = true;
  bool get isLoading => _loading;

  TextEditingController searchController = TextEditingController();
  String text = '';
  Timer? _timer;
  List<BreedEntity> cats = [];
  List<BreedEntity> renderCats = [];

  @override
  void onReady() {
    this.getCats();

    super.onReady();
  }

  void typing() async {
    if(this.text != this.searchController.text){
      if(!this._loading){
        this._loading = true;
        update();
      }

      if (_timer?.isActive ?? false) _timer!.cancel();
        
      _timer = Timer(Duration(milliseconds: 800), () {
        if(this.searchController.text == '') this.renderCats = this.cats;
        else this.renderCats = this.cats.where((e) => (e.name ?? '').toLowerCase().contains(this.searchController.text.toLowerCase())).toList();

        this._loading = false;
        update();
      });
    }
  }


  Future<void> getCats() async {
    this._loading = true;
    update();

    this.text = this.searchController.text;

    final res = await this._getCatsUseCase.call();

    res.fold((l) {
      eitherError(l);
    }, (r) {
      this.cats = r;
      this.renderCats = r;
    });
    
    this._loading = false;
    update();
  }


  void goToDetailView(BreedEntity breed){
    Get.to(() => DetailView(breed: breed));
  }
}
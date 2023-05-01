import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:michis/src/core/settings/app_assets.dart';
import 'package:michis/src/features/presentation/controllers/landing_controller.dart';
import 'package:michis/src/injection.dart';

// ignore: must_be_immutable
class LandingView extends StatelessWidget {
  static const routeName = '/splash';
  final LandingController _ctrl = sl<LandingController>();
  late Size size;
  
  LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Catbreeds',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          )
        ),
        body: GetBuilder<LandingController>(
          init: _ctrl,
          builder: (_) {
            return Column(
              children: [
                SizedBox(height:20),
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: this._buscador(_)
                ),
            
                SizedBox(height:20),
            
                this._list(_)
              ]
            );
          }
        )
      )
    );
  }

  /// muestra el buscador
  Widget _buscador(LandingController ctrl) => TextFormField(
    controller: ctrl.searchController,
    decoration: InputDecoration(
      hintText: 'By Breeds',
      hintStyle: TextStyle(color: Colors.grey),
     suffixIcon: Icon(Icons.search, color: Colors.black),
      border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black))
    ),
    style: TextStyle(color: Colors.black),
    onChanged: (value) => ctrl.typing(),
  );


  /// muestra el contenido de la vista
  Widget _list(LandingController ctrl) {
    if(ctrl.isLoading){
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }

    if(ctrl.renderCats.isEmpty) return Expanded(child: Center(child: Text('No hay razas')));

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: ctrl.renderCats.map((breed) => InkWell(
            onTap: () => ctrl.goToDetailView(breed),
            child: Card(
              elevation: 8,
              margin: EdgeInsets.only(bottom: 15, right: 15, left: 15),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          breed.name ?? '...',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          )
                        ),
                        Text(
                          'More...',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          )
                        )
                      ]
                    ),
          
                    SizedBox(height: 10),
          
                    SizedBox(
                      height: 200,
                      child: FadeInImage(
                        placeholder: AssetImage(AppAssets.loading),
                        image: NetworkImage('https://cdn2.thecatapi.com/images/${breed.idImg}.jpg'),
                        imageErrorBuilder: (context, error, stackTrace) => Image.asset(AppAssets.noImage),
                      )
                    ),
          
                    SizedBox(height: 10),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          breed.origin ?? '...',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          )  
                        ),
                        (breed.temperaments ?? []).isEmpty 
                          ? SizedBox()
                          : Text(
                              breed.temperaments![0],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                              )
                            )
                      ]
                    )
                  ]
                )
              )
            ),
          )).toList()
        )
      )
    );
  }
}
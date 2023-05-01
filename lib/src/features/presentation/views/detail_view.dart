import 'package:flutter/material.dart';
import 'package:michis/src/core/settings/app_assets.dart';
import 'package:michis/src/features/domain/entities/breed_entity.dart';

class DetailView extends StatelessWidget {
  final BreedEntity breed;

  const DetailView({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          this.breed.name ?? 'Catbreeds',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        )
      ),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
            child: FadeInImage(
              placeholder: AssetImage(AppAssets.loading),
              image: NetworkImage('https://cdn2.thecatapi.com/images/${this.breed.idImg}.jpg'),
              imageErrorBuilder: (context, error, stackTrace) => Image.asset(AppAssets.noImage)
            )
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),

                    Text(
                      'Description: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                      )
                    ),

                    SizedBox(height: 5),
                    
                    Text(
                      this.breed.description ?? '...',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      )
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        Text(
                          'Origin: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18
                          )
                        ),
                        Text(
                          this.breed.origin ?? '...',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          )
                        )
                      ]
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Temperaments:',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                      )
                    ),

                    SizedBox(height: 5),
              
                    ...((this.breed.temperaments ?? []).map((e) => Text(
                        e,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        )
                      )
                    ))
                  ]
                ),
              )
            )
          )
        ]
      )
    );
  }
}
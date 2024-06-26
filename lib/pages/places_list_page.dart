import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Lugares'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.placeForm);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future:
              Provider.of<GreatePlaces>(context, listen: false).loadPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatePlaces>(
                  child: const Center(
                    child: Text('nenhum local cadastrado'),
                  ),
                  builder: (context, greatPlaces, ch) =>
                      greatPlaces.itemsCount == 0
                          ? ch!
                          : ListView.builder(
                              itemCount: greatPlaces.itemsCount,
                              itemBuilder: (ctx, i) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: FileImage(greatPlaces
                                          .itemByIndex(i)
                                          .image), //nosso arquivo da camera é o background
                                    ),
                                    title:
                                        Text(greatPlaces.itemByIndex(i).title),
                                    onTap: () {},
                                  ))),
        ));
  }
}

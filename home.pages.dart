import 'package:animations/animations.dart';
import 'package:travel/repositorie/film.data.dart';
import 'package:travel/screens/details.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilmService filmService = FilmService();
    final films = filmService.allFilms();
    ContainerTransitionType transition = ContainerTransitionType.fadeThrough;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Films"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                const TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Effectuez une recherche',
                  hintText: 'Effectuez une recherche',
                )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.search,
                      size: 30,
                    )),
              ],
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: films.length,
                itemBuilder: (context, index) {
                  return OpenContainer(
                      transitionType: transition,
                      transitionDuration: const Duration(seconds: 1),
                      closedBuilder: (context, action) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/${films[index].image}'),
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                      openBuilder: (context, action) {
                        return DetailsPage(
                            titre: films[index].titre,
                            synop: films[index].synop,
                            directeur: films[index].directeur,
                            image: films[index].image);
                      });
                })
          ],
        ),
      ),
    );
  }
}

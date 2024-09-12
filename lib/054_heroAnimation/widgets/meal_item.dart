import 'package:flutter/material.dart';
import 'package:my_app/models/meal.dart';
import 'package:my_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // clip.hardEdge will cut out the redundant of the content if it is large than card
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              // tag will be unique to animation of hero which can know which one will show animation
              tag: meal.id,
              child: FadeInImage(
                // placeholder use for the case which there no image
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                // double.infinity is for the width full screen
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      // maxLines is for the case the title too long
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      // TextOverflow.ellipsis add the ... at the end if the title is too long
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: "${meal.duration} min"),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.work,
                            label: meal.complexity.name),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money,
                            label: meal.affordability.name),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

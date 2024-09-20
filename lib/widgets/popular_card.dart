import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/models/popular_model.dart';

class PopularCard extends StatelessWidget {
  final PopularModel popular;

  const PopularCard(
    this.popular, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 228,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 266,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(popular.imageUrl!),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 62,
                  height: 33,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      popular.isTicket!,
                      // style: orangeTextStyle.copyWith(
                      //   fontWeight: medium,
                      // ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            popular.name!,
            // style: primaryTextStyle.copyWith(
            //   fontSize: 16,
            //   fontWeight: semiBold,
            // ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '${popular.date!} • ${popular.time!}',
            // style: secondaryTextStyle.copyWith(
            //   fontSize: 12,
            // ),
          ),
        ],
      ),
    );
  }
}

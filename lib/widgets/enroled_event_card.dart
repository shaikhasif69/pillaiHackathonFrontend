import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/model/enroledEventModel.dart';
import 'package:pillai_hackcelestial/model/event_model.dart';
import 'package:pillai_hackcelestial/model/onGoingEventMode.dart';
import 'package:socket_io_client/socket_io_client.dart';

class EnroledEventCard extends StatelessWidget {
  final EnrolledEventModel event;
  const EnroledEventCard(
    this.event, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 262,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 176,
                height: 106,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(event.imageUrl!),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SizedBox(
                  height: 34,
                  width: 34,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 18,
                        sigmaY: 18,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            // color: whiteColor.withOpacity(0.2),
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              // event.date!,
                              event.date.toString(),
                              // style: whiteTextStyle.copyWith(
                              //   fontWeight: semiBold,
                              //   fontSize: 12,
                              // ),
                            ),
                            Text(
                              event.creator.username!,
                              // style: whiteTextStyle.copyWith(
                              //   fontSize: 8,
                              // ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/ic_location.png',
                width: 12,
                height: 24,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(event.description.toString()
                  // event.location!,
                  // style: greyTextStyle,
                  ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            event.title.toString()!,
            // event.name!,
            // style: primaryTextStyle.copyWith(
            //   fontWeight: semiBold,
            // ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 33,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Join',
                // style: whiteTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

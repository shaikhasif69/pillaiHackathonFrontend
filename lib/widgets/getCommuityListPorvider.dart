import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/providers/communityListProvider.dart';
import 'package:pillai_hackcelestial/widgets/EventsCrad.dart';

class CommunityList extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ConsumerStateFull();
    throw UnimplementedError();
  }
}

class _ConsumerStateFull extends ConsumerState<CommunityList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(communityListProvider.notifier).getCommutityList();
    });
  }

  Widget build(context) {
    var data = ref.watch(communityListProvider);
    return data == null
        ? CircularProgressIndicator()
        : data.isEmpty
            ? Center(
                child: Text("Empty"),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Upcomning Events",
                      style: GoogleFonts.abyssinicaSil(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListView.builder(
                      itemCount: data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return EventsCard(
                          data: data[index],
                        );
                      })
                ],
              );
  }
}

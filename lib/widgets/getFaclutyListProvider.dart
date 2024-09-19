import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/providers/FacultyProvider.dart';
import 'package:pillai_hackcelestial/widgets/StudentCard.dart';
import 'package:pillai_hackcelestial/widgets/mentorCards.dart';

class GetFalcultyList extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GetFalcultyListProvider();
    throw UnimplementedError();
  }
}

class _GetFalcultyListProvider extends ConsumerState<GetFalcultyList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(FacultyListProvider.notifier).getfaclutyList();
    });
  }

  Widget build(context) {
    var data = ref.watch(FacultyListProvider);
    return data == null
        ? CircularProgressIndicator()
        : data.isEmpty
            ? Center(
                child: Text("Empty"),
              )
            : Container(
                height: 200,
                child: Card(
                  elevation: 10,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (BuildContext contex, int index) {
                        return MentorCards(
                          data: data[index],
                        );
                      }),
                ),
              );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/providers/FacultyProvider.dart';
import 'package:pillai_hackcelestial/providers/StudentListProvider.dart';

class TextBarFaculty extends ConsumerStatefulWidget {
  TextEditingController facultyName;
  TextBarFaculty({required this.facultyName});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TexBarFaculty();
    throw UnimplementedError();
  }
}

class _TexBarFaculty extends ConsumerState<TextBarFaculty> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(FacultyListProvider.notifier).getfaclutyList();
    });
  }

  String selected = "";
  Widget build(context) {
    ref.watch(FacultyListProvider);
    var data = ref.read(FacultyListProvider.notifier).filteredData;
    print(data);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Focus(
            onFocusChange: (value) {
              if (selected == "") {
                widget.facultyName.text = "";
                setState(() {});
              }
            },
            child: TextFormField(
              onChanged: (v) {
                // selected = "";
                if (selected != "" && v != selected) {
                  selected = "";
                  widget.facultyName.text = "";
                }
                ref.read(FacultyListProvider.notifier).filterFaculty(v);
                setState(() {});
              },
              controller: widget.facultyName,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 169, 137, 250)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 169, 137, 250)),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          widget.facultyName.text != ""
              ? selected == ""
                  ? Card(
                      child: Container(
                        height: 300,
                        child: data == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : data.isEmpty
                                ? Center(
                                    child: Text("No Such Falculty"),
                                  )
                                : ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              selected = data[index].email!;
                                              widget.facultyName.text = "";
                                              widget.facultyName.text =
                                                  selected;
                                              setState(() {});
                                            },
                                            child: ListTile(
                                              leading: Container(
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: data[index]
                                                                    .imageUrl ==
                                                                null
                                                            ? AssetImage(
                                                                "assets/images/Male User.png")
                                                            : NetworkImage(data[
                                                                    index]
                                                                .imageUrl!))),
                                              ),
                                              title: Text("Prof " +
                                                  data[index].username!),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(data[index].subject!),
                                                  Text(data[index].department!)
                                                ],
                                              ),
                                              trailing: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 178, 230, 175),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                width: 55,
                                                height: 40,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        data[index]
                                                            .experience
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.mulish(
                                                                fontSize: 14),
                                                      ),
                                                      Icon(Icons.star_border)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider()
                                        ],
                                      );
                                    }),
                      ),
                    )
                  : SizedBox()
              : SizedBox(),
        ],
      ),
    );
  }
}

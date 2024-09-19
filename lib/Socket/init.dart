import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Disscussion.dart';
import 'package:pillai_hackcelestial/providers/DiscussionProvider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MySocketConnetion {
  static final Socket socket = io('http://localhost:3000', <String, dynamic>{
    'transports': ['websocket'],
    'token':
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hYWRhcnNoMjNjb21wQHN0dWRlbnQubWVzLmFjLmluIiwiaWQiOiI2NmU2OTI2MzM2NDU1MDcwZTcyZTRiY2IiLCJpYXQiOjE3MjY2NDYyNTcsImV4cCI6MTcyOTIzODI1N30.GVoAuF2PgiEnUfg1jOecZDVVnkrQkNr0Qj7en7PBMCc"
  });

  static void connect() async {
    print("hshhs");
    socket.connect();
    socket.onConnect((_) {
      print('connect');
      socket.emitWithAck('msg', 'init', ack: (data) {
        print('ack $data');
        if (data != null) {
          print('from server $data');
        } else {
          print("Null");
        }
      });
    });
  }
}

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hYWRhcnNoMjNjb21wQHN0dWRlbnQubWVzLmFjLmluIiwiaWQiOiI2NmU2OTI2MzM2NDU1MDcwZTcyZTRiY2IiLCJpYXQiOjE3MjY2NDYyNTcsImV4cCI6MTcyOTIzODI1N30.GVoAuF2PgiEnUfg1jOecZDVVnkrQkNr0Qj7en7PBMCc"; // Fetch the token however you store it

class mySocketConnect {
  static late Socket socket;
  static late WidgetRef ref;
  static void getDissInit(WidgetRef refff) {
    ref = refff;
  }

  static void connect() async {
    socket = io(
        urlAddress,
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setAuth({'token': token}) // disable auto-connection
            // .setExtraHeaders(ServerDetails.token) // optional
            .build());
    socket.connect();
    socket.onConnect((_) {
      developer.log("Connected to sockets");
    });

    socket.onError(
        (data) => developer.log(data.toString(), name: "error on socket"));
    socket.on('notification', (data) {
      developer.log("hehey recived");
    });

    mySocketConnect.socket.on('message', (data) {
      developer.log("New message received" + data.toString());
      if (data.containsKey("disussion")) {
        if (data['disussion'] == true) {
          ref
              .read(DiscussionProvider.notifier)
              .updateChats(Discussion.fromJson(data));
        }
      }
    });
  }
}

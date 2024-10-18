import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final _messageStreamController = BehaviorSubject<RemoteMessage>();

  // REQUEST PERMISSION: call this in main on startup
  Future<void> requestPermission()async{
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

    if(settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    }else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    }else {
      print('User declined or has not accepted permission');
    }
  }

  ///SETUP INTERACTION
  void setupInteractions(){
    //user received message
    FirebaseMessaging.onMessage.listen((event){
      print('Got a message whilst in the foreground!');
      print('Message data: ${event.data}');

      _messageStreamController.sink.add(event);
    });

    // user opened message
    FirebaseMessaging.onMessageOpenedApp.listen((event){
      print('Message clicked');
    });
  }

  void dispose(){
    _messageStreamController.close();
  }

  // SETUP  TOKEN LISTENERS
}


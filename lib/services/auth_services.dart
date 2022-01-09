part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference psikologCollection =
      FirebaseFirestore.instance.collection("psikologs");
  static DocumentReference? userDoc;
  final dbref = FirebaseFirestore.instance.collection('psikologs');

  static Future<String> SignUp(Psikologs psikologs) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String msg = "";
    String token = "";
    String uid = "";

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: psikologs.email, password: psikologs.password);
    uid = userCredential.user!.uid;
    token = (await FirebaseMessaging.instance.getToken())!;

    await psikologCollection.doc(uid).set({
      "uid": uid,
      "name": psikologs.name,
      "phone": psikologs.phone,
      "email": psikologs.email,
      "password": psikologs.password,
      "token": token,
      'isOn': '0',
      "createdAt": dateNow,
      "updatedAt": dateNow,
    }).then((value) {
      msg = "success";
    }).catchError((onError) {
      msg = onError;
    });

    auth.signOut();

    return msg;
  }

  static Future<String> SignIn(String email, String password) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String msg = "";
    String uid = "";
    String token = "";
    // var roole = (await FirebaseFirestore.instance.collection('users').doc(uid).collection('role').doc().get()).data().toString();

    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    uid = userCredential.user!.uid;
    token = (await FirebaseMessaging.instance.getToken())!;

    await psikologCollection.doc(uid).update({
      // "role": roole,
      "isOn": "1",
      "token": token,
      "updatedAt": dateNow,
    }).then((value) {
      msg = "success";
    }).catchError((onError) {
      msg = onError;
    });

    return msg;
  }

  static Future<bool> SignOut() async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String uid = auth.currentUser!.uid;

    await auth.signOut().whenComplete(() {
      psikologCollection.doc(uid).update({
        'isOn': '0',
        "token": "-",
        "updatedAt": dateNow,
      });
    });

    return true;
  }

  static Future UpdateUserList(String name, String phone) async {
    String uid = auth.currentUser!.uid;
    return await psikologCollection.doc(uid).update({
      "name": name,
      "phone": phone,
      "uid": uid,
    });
  }
}

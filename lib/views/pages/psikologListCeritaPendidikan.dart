part of 'pages.dart';

class ListCeritaPendidikanPsikolog extends StatefulWidget {
  static const String routeName = "/listceritapendidikanpsikolog";

  @override
  _ListCeritaPendidikanPsikologState createState() =>
      _ListCeritaPendidikanPsikologState();
}

class _ListCeritaPendidikanPsikologState
    extends State<ListCeritaPendidikanPsikolog> {
  CollectionReference pendidikanCollection =
      FirebaseFirestore.instance.collection("pendidikan");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: pendidikanCollection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Failed to load data");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return ActivityServices.loadings();
            }
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                Pendidikan pendidikan = new Pendidikan(
                  doc['pendidikanUid'],
                  doc['PendidikanData'],
                  doc['createdAt'],
                  doc['updatedAt'],
                  doc['likes'],
                );
                return pendidikanCard(pendidikan: pendidikan);
              }).toList(),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd09484),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.popAndPushNamed(context, PsikologMainMenu.routeName);
          },
        ),
        title: Text("Pendidikan"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}

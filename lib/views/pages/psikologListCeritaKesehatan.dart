part of 'pages.dart';

class ListCeritaKesehatanPsikolog extends StatefulWidget {
  static const String routeName = "/listceritakesehatanpsikolog";

  @override
  _ListCeritaKesehatanPsikologState createState() =>
      _ListCeritaKesehatanPsikologState();
}

class _ListCeritaKesehatanPsikologState
    extends State<ListCeritaKesehatanPsikolog> {
  CollectionReference kesehatanCollection =
      FirebaseFirestore.instance.collection("kesehatan");

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: kesehatanCollection.snapshots(),
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
                Kesehatan kesehatan = new Kesehatan(
                  doc['KesehatanUid'],
                  doc['KesehatanData'],
                  doc['createdAt'],
                  doc['updatedAt'],
                  doc['likes'],
                );
                return KesehatanCard(kesehatan: kesehatan);
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
        title: Text("Kesehatan"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }
}

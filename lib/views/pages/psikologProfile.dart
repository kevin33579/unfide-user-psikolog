part of 'pages.dart';

class ProfilePsikolog extends StatefulWidget {
  const ProfilePsikolog({Key? key}) : super(key: key);

  @override
  _ProfilePsikologState createState() => _ProfilePsikologState();
}

class _ProfilePsikologState extends State<ProfilePsikolog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffd09484),
          title: Text("P R O F I L E"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ProfileSetting.routeName);
                  },
                  child: Icon(
                    Icons.settings,
                  ),
                )),
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 115,
            width: 115,
            child: CircleAvatar(
              backgroundColor: Colors.cyan,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, UserEditProfile.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffd09484),
                onPrimary: Colors.white,
              ),
              child: Text('Edit Profile')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, psikologEditJadwal.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffd09484),
                onPrimary: Colors.white,
              ),
              child: Text('Edit Jadwal')),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ]));
  }
}

part of 'widgets.dart';

class PsikologCard extends StatefulWidget {
  final Psikologs psikologs;

  PsikologCard({required this.psikologs});

  @override
  _PsikologCardState createState() => _PsikologCardState();
}

class _PsikologCardState extends State<PsikologCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              trailing: TextButton(
                child: Text('Pilih'),
                onPressed: () {
                  // Navigator.pushReplacementNamed(
                      // context, ListCeritaPendidikanPsikolog.routeName);
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed:() {

                  },
                  icon: Image.asset('assets/icons/j.png'),
                ),
                // Text(''+pendidikan.likes.toString()+' '),
                // Text(''+pendidikan.createdAt),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

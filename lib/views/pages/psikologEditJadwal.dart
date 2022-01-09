part of 'pages.dart';

class psikologEditJadwal extends StatefulWidget {
  static const String routeName = "/psikologeditjadwal";

  @override
  _psikologEditJadwalState createState() => _psikologEditJadwalState();
}

class _psikologEditJadwalState extends State<psikologEditJadwal> {
  String dropdownValue = 'senin';
  final ctrlJam = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ctrlNama = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd09484),
        title: Text("EDIT JADWAL"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: ctrlNama,
              decoration: InputDecoration(
                labelText: "nama",
                border: OutlineInputBorder(),
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'senin',
                'selasa',
                'rabu',
                'kamis',
                'jumat',
                'sabtu',
                'minggu'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextFormField(
              controller: ctrlJam,
              decoration: InputDecoration(
                labelText: "ex: 13:00 - 14:00",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  if (dropdownValue.toString() == 'senin') {
                    await SeninServices.addData(ctrlNama.text, ctrlJam.text)
                        .then((value) {
                      if (value == "success") {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast("success", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, PsikologMainMenu.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });

                    //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                  } else if (dropdownValue.toString() == 'selasa') {
                    await SelasaServices.addData(ctrlNama.text, ctrlJam.text)
                        .then((value) {
                      if (value == "success") {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast("success", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, PsikologMainMenu.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });

                    //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                  } else if (dropdownValue.toString() == 'rabu') {
                    await RabuServices.addData(ctrlNama.text, ctrlJam.text)
                        .then((value) {
                      if (value == "success") {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast("success", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, PsikologMainMenu.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });

                    //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                  } else if (dropdownValue.toString() == 'kamis') {
                    await KamisServices.addData(ctrlNama.text, ctrlJam.text)
                        .then((value) {
                      if (value == "success") {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast("success", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, PsikologMainMenu.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });

                    //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                  } else if (dropdownValue.toString() == 'jumat') {
                    await JumatServices.addData(ctrlNama.text, ctrlJam.text)
                        .then((value) {
                      if (value == "success") {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast("success", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, PsikologMainMenu.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });

                    //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                  } else if (dropdownValue.toString() == 'sabtu') {
                    await SabtuServices.addData(ctrlNama.text, ctrlJam.text)
                        .then((value) {
                      if (value == "success") {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast("success", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, PsikologMainMenu.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });

                    //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                  } else if (dropdownValue.toString() == 'minggu') {
                    await MingguServices.addData(ctrlNama.text, ctrlJam.text)
                        .then((value) {
                      if (value == "success") {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast("success", Colors.green);
                        Navigator.pushReplacementNamed(
                            context, PsikologMainMenu.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });

                    //Navigator.pushReplacementNamed(context, MainMenu.routeName);
                  }
                }else {
                    Fluttertoast.showToast(
                      msg: "Please check the fields",
                    );
                  }

              },
              icon: Icon(Icons.save),
              label: Text("Save"),
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

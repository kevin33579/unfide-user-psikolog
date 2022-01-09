part of 'models.dart';

class JadwalPsikolog extends Equatable{
  String jam;
  String hari;

  JadwalPsikolog(this.jam , this.hari);

  @override
  List<Object> get props => [
    jam,
    hari,
  ];
}
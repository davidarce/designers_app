import 'package:designers_app/model/designer.dart';
import 'package:sprintf/sprintf.dart';
import 'dart:math';

class DesignerDatabase {

  final names = ["Amanda Murphy", "Grace Hartzel", "Bella Hadid", "Julia Bergshoeff", "Malaika Firth"];
  final String pathPhoto = "assets/img/%s.jpeg";
  final int min = 1;
  final int max = 5;

  List<Designer> generateDesigners() {
    List<Designer> designers = new List();

    for (var i = 0; i < names.length; i++) {
      int index =  Random().nextInt((max - min) + 1) + min;
      int experience =  Random().nextInt((10 - min) + 1) + min;
      designers.add(new Designer(sprintf(pathPhoto, [index]), names[--index], experience, sprintf("desginer%s@email.com", [index])));
    }
    return designers;
  }
}
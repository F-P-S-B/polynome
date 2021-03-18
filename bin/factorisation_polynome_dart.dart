import 'polynome.dart';

void main(List<String> arguments) {
  final polynome = Polynome.formeDeveloppee(b: -1, c: -1);
  print(polynome.formeDeveloppee);
  print(polynome.formeCanonique);
  print(polynome.formeFactorisee);
}

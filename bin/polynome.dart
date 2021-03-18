import 'dart:math' show sqrt;

class Polynome {
  // Variables
  final num a;
  num b;
  num c;
  num delta;
  num alpha;
  num beta;
  num x1;
  num x2;
  String formeDeveloppee;
  String formeFactorisee;
  String formeCanonique;
  //Constructeurs
  Polynome.formeDeveloppee({a = 1, this.b = 0, this.c = 0})
      // ignore: unnecessary_this
      : this.a = a == 0 ? 1 : a {
    delta = b * b - 4 * a * c;
    alpha = -b / (2 * a);
    beta = -delta / (4 * a * a);
    x1 = (-b - sqrt(delta)) / (2 * a);
    x2 = (-b + sqrt(delta)) / (2 * a);
    formeDeveloppee = _calculFormeDeveloppee();
    formeCanonique = _calculFormeCanonique();
    formeFactorisee = _calculFormeFactorisee();
  }

  Polynome.formeCanonique({a = 1, this.alpha = 0, this.beta = 0})
      // ignore: unnecessary_this
      : this.a = a == 0 ? 1 : a {
    b = -2 * a * alpha;
    c = (b * b - delta) / (4 * a);
    delta = b * b - 4 * a * c;
    x1 = (-b - sqrt(delta)) / (2 * a);
    x2 = (-b + sqrt(delta)) / (2 * a);
    formeDeveloppee = _calculFormeDeveloppee();
    formeCanonique = _calculFormeCanonique();
    formeFactorisee = _calculFormeFactorisee();
  }

  Polynome.formeFactorisee({a = 1, this.x1 = 0, this.x2 = 0})
      // ignore: unnecessary_this
      : this.a = a == 0 ? 1 : a {
    b = -2 * a * alpha;
    c = (b * b - delta) / (4 * a);
    delta = b * b - 4 * a * c;
    alpha = -b / (2 * a);
    beta = -delta / (4 * a * a);
    formeDeveloppee = _calculFormeDeveloppee();
    formeCanonique = _calculFormeCanonique();
    formeFactorisee = _calculFormeFactorisee();
  }

  //Méthodes
  String _calculFormeDeveloppee() {
    if (b == 0 && c == 0) {
      return '${a == 1 ? '' : '$a'}x² ';
    }
    if (b == 0) {
      return '${a == 1 ? '' : '$a'}x² ${c > 0 ? '+ $c' : '- ${-c}'}';
    }
    if (c == 0) {
      '${a == 1 ? '' : '$a'}x² ${b > 0 ? '+ $b' : '- ${-b}'}x';
    }
    return '${a == 1 ? '' : '$a'}x² ${b > 0 ? '+ $b' : '- ${-b}'}x ${c > 0 ? '+ $c' : '- ${-c}'}';
  }

  String _calculFormeCanonique() {
    var body;
    if (alpha == 0.0 && beta == 0.0) {
      print('test');
      body = 'x²';
    } else if (alpha == 0) {
      body = 'x² ${beta > 0 ? '+ $beta' : '- ${-beta}'}';
    } else if (beta == 0) {
      body = '(x ${alpha > 0 ? '- $alpha' : '+ ${-alpha}'})²';
    } else {
      body =
          '(x ${alpha > 0 ? '- $alpha' : '+ ${-alpha}'})² ${beta > 0 ? '+ $beta' : '- ${-beta}'}';
    }
    return '${a == 1 ? body : '$a * ($body)'}';
  }

  String _calculFormeFactorisee() {
    if (x1 == x2 && x1 == 0) {
      return '${a == 1 ? '' : '$a * '}x²';
    }
    if (x1 == x2) {
      return '${a == 1 ? '' : '$a * '}(x ${x1 > 0 ? '- $x1' : '+ ${-x1}'})²';
    }
    return '${a == 1 ? '' : '$a * '}(x ${x1 > 0 ? '- $x1' : '+ ${-x1}'})(x ${x2 > 0 ? '- $x2' : '+ ${-x2}'})';
  }
}

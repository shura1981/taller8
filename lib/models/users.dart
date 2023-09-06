class Usuarios {
  String nombre;
  String correo;
  String? celular;
  late DateTime _fechaNacimiento; // Variable privada para almacenar la fecha
  String get fechaNacimiento => _fechaNacimiento.toIso8601String(); // Getter

  // Setter que convierte la fecha en formato 'yyyy-month-day' a DateTime
  set fechaNacimiento(String date) {
    _fechaNacimiento = DateTime.parse(date);
  }

  Usuarios({
    required this.nombre,
    required this.correo,
    this.celular,
    required fechaNacimiento,
  }) {
    this.fechaNacimiento = fechaNacimiento;
  }
// Método fromJson
  static Usuarios fromJson(Map<String, dynamic> json) {
    return Usuarios(
      nombre: json['nombre'],
      correo: json['correo'],
      celular: json['celular'],
      fechaNacimiento: DateTime.parse(json['fecha_nacimiento']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'correo': correo,
      if (celular != null) 'celular': celular,
      'fecha_nacimiento': fechaNacimiento,
    };
  }
}

void main() {
  // Ejemplo de cómo usar la clase y su método toJson()
  Usuarios usuario = Usuarios(
    nombre: 'Juan Perez',
    correo: 'juan.perez@example.com',
    celular: '123-456-7890',
    fechaNacimiento: '1990-01-01',
  );

  print(usuario.toJson());
}

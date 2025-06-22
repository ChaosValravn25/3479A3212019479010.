class UserFeedback {
  final String userId;
  final Map<String, int> usabilidad;
  final Map<String, int> contenido;
  final Map<String, int> compartir;

  UserFeedback({
    required this.userId,
    required this.usabilidad,
    required this.contenido,
    required this.compartir,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'usabilidad': usabilidad,
      'contenido': contenido,
      'compartir': compartir,
    };
  }
}

class ServiceField {
  final String name; // Label of the field
  final String type; // Field type: 'text', 'radio', 'file', etc.
  final List<String>? options; // For options in radio fields
  final bool isRequired; // Indicates if the field is mandatory

  ServiceField({
    required this.name,
    required this.type,
    this.options,
    this.isRequired = false,
  });
}

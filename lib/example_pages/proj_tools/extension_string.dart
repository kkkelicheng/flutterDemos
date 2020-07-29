
extension CheckEmptyString on String {
  bool get lcIsNotEmpty => !((this == null) || this.isEmpty);
}

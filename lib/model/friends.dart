class Friends {
  String? name;
  final String? image;
  bool isSelected;

  Friends({this.name, this.image, this.isSelected = false});
}

List<Friends> friends = [
  Friends(name: 'Janet Samuel'),
  Friends(name: 'Sanni Bako'),
  Friends(name: 'Kayode Peter')
];

class Words {
  int? _id;
  String? _firstWord;
  String? _secondWord;

  Words(this._firstWord, this._secondWord);
  Words.withId(this._id, this._firstWord, this._secondWord);

  int? get id => _id;
  String? get firstWord => _firstWord;
  String? get secondWord => _secondWord;

  set firstWord(String? value) {
    if (value != null) {
      _firstWord = value;
    }
  }

  set secondWord(String? value) {
    if (value != null) {
      _secondWord = value;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id'] = this._id;
    map['firstWord'] = this._firstWord;
    map['secondWord'] = this._secondWord;

    return map;
  }

  Words.getMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._firstWord = map['firstWord'];
    this._secondWord = map['secondWord'];
  }
}

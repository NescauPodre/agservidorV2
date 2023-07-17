
class Alias {
  String? Aliasname;
  String? Aliasvalor;

  Alias({
    this.Aliasname,
    this.Aliasvalor,
  });

  Alias.fromJson(Map<String, dynamic> json) {
    Aliasname = json['Aliasname'];
    Aliasvalor = json['Aliasvalor'];
  }
}

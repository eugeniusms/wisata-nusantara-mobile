// Class untuk menampilkan kerangka User
class User {
  String username = "";
  User(this.username);
}

// Variabel data untuk menyimpan User loggedin
class UserLoggedIn {
  static User user = User("");
}

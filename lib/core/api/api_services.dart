class ApiService {
  final _auth;

  ApiService(this._auth);

  Future<dynamic> login(
      {required String email, required String password}) async {
    dynamic response = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return response;
  }
}

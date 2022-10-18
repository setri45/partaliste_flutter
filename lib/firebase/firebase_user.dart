class FirebaseUser {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final bool emailVerified;
  final String phoneNumber;
  final List<String> providerData;
  final Map<String, dynamic> additionalUserInfo;
  final Map<String, dynamic> metadata;

  FirebaseUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.emailVerified,
    required this.phoneNumber,
    required this.providerData,
    required this.additionalUserInfo,
    required this.metadata,
  });

  FirebaseUser.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        email = map['email'],
        displayName = map['displayName'],
        photoUrl = map['photoUrl'],
        emailVerified = map['emailVerified'],
        phoneNumber = map['phoneNumber'],
        providerData = map['providerData'],
        additionalUserInfo = map['additionalUserInfo'],
        metadata = map['metadata'];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'emailVerified': emailVerified,
      'phoneNumber': phoneNumber,
      'providerData': providerData,
      'additionalUserInfo': additionalUserInfo,
      'metadata': metadata,
    };
  }
}

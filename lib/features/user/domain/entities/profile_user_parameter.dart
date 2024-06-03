class ProfileUserParameter {
  final String? name;
  final String? email;
  final String? phone;
  final String? bloodType;
  final bool? gender;
  final String? photoUrl;
  final int? age;
  final String? password;

  ProfileUserParameter({
    this.gender,
    this.age,
    this.password,
    this.name,
    this.email,
    this.phone,
    this.bloodType,
    this.photoUrl,
  });

  factory ProfileUserParameter.fromMap(Map<String, dynamic> map) {
    return ProfileUserParameter(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      bloodType: map['bloodType'],
      photoUrl: map['photoUrl'],
      age: map['age'],
      gender: map['gender']
    );
  }
}

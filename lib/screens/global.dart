import 'package:firebase_auth/firebase_auth.dart';
import 'package:vidyavikalp/models/user_models.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
User? currentUser;

UserModel? userModelCurrentInfo;
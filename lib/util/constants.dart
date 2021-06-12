import 'package:flutter/material.dart';
import 'package:suche_app/util/custom_colors.dart';

// Constantes de rotas usadas no app
const String homeRoute = '/';
const String loginRoute = '/login';
const String registerUserRoute = '/registerUser';
const String perfilRoute = '/perfil';
const registerPromoterRoute = '/registerPromoter';
const registerEventRoute = 'registerEvent';
const registerEventLocalRoute = 'registerEventLocal';

// Constantes para estilização
final kHintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

final kErrorTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: CustomColors.orangePrimary.shade50,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
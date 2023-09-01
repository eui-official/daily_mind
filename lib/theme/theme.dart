import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = FlexThemeData.dark(
  fontFamily: GoogleFonts.inter().fontFamily,
  scheme: FlexScheme.sakura,
  useMaterial3: true,
);

double spacing([size = 1]) => size * 8.0;

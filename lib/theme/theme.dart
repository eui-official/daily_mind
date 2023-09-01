import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = FlexThemeData.dark(
  fontFamily: GoogleFonts.inter().fontFamily,
  scheme: FlexScheme.sakura,
  subThemesData: FlexSubThemesData(
    elevatedButtonRadius: spacing(5),
  ),
);

double spacing([size = 1]) => size * 8.0;

import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

const kDefaultThemeId = "deepPurple";

const kDefaultTheme = SupportedTheme(
  id: "deepPurple",
  title: 'Deep Purple',
  scheme: FlexScheme.deepPurple,
);

List<SupportedTheme> kSupportedThemes = [
  kDefaultTheme,
  const SupportedTheme(
    id: "teal",
    title: 'Teal',
    scheme: FlexScheme.amber,
  ),
  const SupportedTheme(
    id: "amber",
    title: 'Amber',
    scheme: FlexScheme.amber,
  ),
  const SupportedTheme(
    id: "aquaBlue",
    title: 'Aqua Blue',
    scheme: FlexScheme.aquaBlue,
  ),
  const SupportedTheme(
    id: "red",
    title: 'Red',
    scheme: FlexScheme.red,
  ),
  const SupportedTheme(
    id: "mandyRed",
    title: 'Mandy Red',
    scheme: FlexScheme.mandyRed,
  ),
  const SupportedTheme(
    id: "indigo",
    title: 'Indigo',
    scheme: FlexScheme.indigo,
  ),
  const SupportedTheme(
    id: "wasabi",
    title: 'Wasabi',
    scheme: FlexScheme.wasabi,
  ),
];

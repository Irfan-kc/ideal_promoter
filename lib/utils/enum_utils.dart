import 'package:ideal_promoter/utils/collections_util.dart';

bool isEnum(item) {
  final split = item.toString().split('.');
  return split.length > 1 && split[0] == item.runtimeType.toString();
}

String enumToString(dynamic enumItem) {
  assert(enumItem != null);
  assert(isEnum(enumItem),
      'Item $enumItem of type ${enumItem.runtimeType.toString()} is not enum');
  return enumItem.toString().split('.')[1];
}

E? enumFromString<E>(List<E?> enumValues, String? value) {
  if (value == null) {
    return null;
  }

  return enumValues
      .firstWhereOrElseNullable((enumItem) => enumToString(enumItem) == value);
}

E? enumFromStringLookupMap<E>(Map<E, String> enumStringMap, String? value) {
  if (value == null) {
    return null;
  }

  Iterable<MapEntry<E, String>?> enumEntries = enumStringMap.entries;
  return enumEntries
      .firstWhereOrElseNullable((e) => e?.value == value, orElse: () => null)
      ?.key;
}

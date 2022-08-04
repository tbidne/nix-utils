let
  add-non-null = attrs: key: val:
    if val != null
    then attrs // { ${key} = val; }
    else attrs;
  add-non-nulls = attrs: entries:
    let goodKeys = builtins.foldl' (acc: e: add-non-null acc e.key e.val) { } entries;
    in attrs // goodKeys;
in
{
  inherit
    add-non-null
    add-non-nulls;
}

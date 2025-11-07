from pathlib import Path
import sys
import argparse
import xmlschema

def find_ccmm_root(start: Path) -> Path:
    # Hledá kořen klonu CCMM (tam kde je dataset/schema.xsd)
    for p in [start] + list(start.parents):
        if (p / "dataset" / "schema.xsd").exists():
            return p
    raise FileNotFoundError("Nenalezen CCMM kořen s dataset/schema.xsd")

def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description="Validace CCMM XML proti dataset/schema.xsd"
    )
    parser.add_argument(
        "xml",
        help="Cesta k XML souboru (relativně vůči repu nebo absolutně).",
    )
    args = parser.parse_args(argv)

    script_dir = Path(__file__).resolve().parent
    try:
        ccmm_root = find_ccmm_root(script_dir)
    except FileNotFoundError as e:
        print(f"[error] {e}")
        return 2

    xsd_path = ccmm_root / "dataset" / "schema.xsd"

    # Vyřešení relativních cest: nejdřív vůči skriptu, pak vůči kořeni repa
    xml_path = Path(args.xml)
    if not xml_path.is_absolute():
        if (script_dir / xml_path).exists():
            xml_path = (script_dir / xml_path).resolve()
        elif (ccmm_root / xml_path).exists():
            xml_path = (ccmm_root / xml_path).resolve()
        else:
            xml_path = xml_path.resolve()

    print(f"[info] CCMM root: {ccmm_root}")
    print(f"[info] XSD      : {xsd_path}")
    print(f"[info] XML      : {xml_path}")

    if not xsd_path.exists():
        print(f"[error] XSD nenalezeno: {xsd_path}")
        return 2
    if not xml_path.exists():
        print(f"[error] XML nenalezeno: {xml_path}")
        return 2

    try:
        schema = xmlschema.XMLSchema11(xsd_path)  # XSD 1.1
        if schema.is_valid(xml_path):
            print("Valid XML")
            return 0
        else:
            print("Invalid XML")
            for err in schema.iter_errors(xml_path):
                print(f"- {err.path}: {err.reason}")
            return 1
    except Exception as e:
        print(f"[error] Neošetřená výjimka: {e}")
        return 3

if __name__ == "__main__":
    sys.exit(main())

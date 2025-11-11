# CCMM Examples (v1.1.0)

**IMPORTANT NOTE**: These examples were originally prepared for CCMM 1.0.0 and have now been updated for CCMM 1.1.0. Element ordering, property names, and/or cardinalities may differ; each example has been revalidated against the current 1.1.0 version (from 11 November, 2025).

This branch contains **illustrative examples of CCMM XML**, created by converting source records 
from the Czech national “catch-all” repository of datasets:  
https://data.narodni-repozitar.cz/

In addition, a model reference record in `examples/ccmm_sample.xml` illustrates both **mandatory 
and optional elements** defined by the **CCMM 1.1.0** model. It can be used for **future JSON→XML conversions**, **validation** and **documentation alignment**.  
The file `dataset-mini.xml` then provides a **minimal valid CCMM 1.1.0** dataset example showing only **mandatory** and **profile-mandatory** elements.

## What this is

- A small collection of **example CCMM XML 1.1.0 files** showing how real-world repository records can be represented in the CCMM profile.
- The examples are intentionally diverse and annotated via XML comments where useful. They are **not normative** and may highlight open modelling questions.
- The file "dataset-mini.xml" is an example of a valid CCMM dataset containing only the minimal set of mandatory and conditionally mandatory elements.
- The file "ccmm_sample.xml" serves as a model reference record based on the CCMM schema (v1.1.0). It is a fictional example that includes both mandatory and optional dataset elements and can be used  
as a basis for future JSON→XML conversions and documentation consistency checks.

## Data source & conversion

- **Source:** public records from the “catch-all” repository (link above).  
- **Conversion:** JSON → CCMM XML with light normalisation (e.g., vocabulary IRIs, XSD-required ordering) and conservative handling of missing values (e.g., DataCite “unknown” tokens in text fields where appropriate).
- Non-trivial decisions are briefly noted **inside the XML as comments** or captured in a separate transfer note/report.

## What’s inside

examples/
xd12h-dfz24/
xd12h-dfz24.xml # sample JSON → CCMM XML

examples/
1m3t2-78951/
1m3t2-78951.xml # sample JSON → CCMM XML

examples/
h2kj8-7df02/
h2kj8-7df02.xml # sample JSON → CCMM XML

examples/
dmq82-ed856/
dmq82-ed856.xml # sample JSON → CCMM XML

examples/
mff4d-q4a24/
mff4d-q4a24.xml # sample JSON → CCMM XML

examples/
dataset-mini/
dataset-mini.xml # sample CCMM XML – Minimal valid CCMM dataset example showing only mandatory and profile-mandatory elements.

examples/ ccmm_sample.xml # model example – fictional dataset record including both mandatory and optional elements according to the CCMM model.

README.md # (this file)

xml-validate.py # optional helper script

## Validation (optional)

`xml-validate.py` can validate example CCMM XML files against the CCMM 1.1.0 profile XSD.  
Requirements: Python 3.10+; `pip install xmlschema`.  
The script uses `dataset/schema.xsd` at the CCMM repo root and prints `Valid XML` or a list of schema errors.

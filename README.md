# Czech Core Metadata Model specification

This repository contains the specification of the Czech Core Metadata Model for research data description modelled in and generated from DataSpecer.
Changes are described in [RELEASE_NOTES](RELEASE_NOTES.md).
DataSpecer generates a schema diagram in bad resolution; therefore, we generated a diagram image in better quality.
![CCMM schema diagram](CCMM-model.png)

The structure of the repository is as follows. For the documentation and publication purposes were created GitHub pages. In each section, there is a link to the published specifications.

The CCMM model is licensed under [CC BY](https://creativecommons.org/licenses/by/4.0/) license.

## cs

Directory /cs contains Czech version of CCMM Application Profile specification. Specification is available on [https://techlib.github.io/CCMM/cs/](https://techlib.github.io/CCMM/cs/).

## en

Directory /en contains English version of CCMM Application Profile specification. Specification is available on [https://techlib.github.io/CCMM/en/](https://techlib.github.io/CCMM/en/).

## XSD representation

The root directory also contains all structured artifacts generated from Dataspecer. There are many subdirectories, one per each element of the data structures. 

Each subdirectory contains structured models formalized in XSD (schema.xsd). The root element for the whole profile is **Dataset**

|Root element|XSD schema|
| - | - | 
|Dataset|[https://techlib.github.io/CCMM/dataset/schema.xsd](https://techlib.github.io/CCMM/dataset/schema.xsd)|

## Sample XML

[Metadata samples in XML](https://github.com/techlib/CCMM/tree/main/_metadata-samples/xml) are provided. For example, there is a sample on air quality data with links and a relation to existing resources, introducing most of the use cases users may encounter.

The file [`dataset-mini.xml`](https://github.com/techlib/CCMM/blob/main/_metadata-samples/xml/dataset-mini.xml) provides a minimal valid CCMM dataset example showing only mandatory and conditionally mandatory elements.

## Dataspecer project

[Project to open in DataSpecer](https://github.com/techlib/CCMM/blob/main/Czech%20Core%20Metadata%20Model-backup.zip) is also part of the repository. You may import it into your instance of Dataspecer.

# Czech Core Metadata Model specification

This repository contains the specification of the Czech Core Metadata Model for research data description modelled in and generated from DataSpecer.
Changes are described in [RELEASE_NOTES](RELEASE_NOTES.md).

![CCMM schema diagram](d19697d9-b1fe-427a-874b-0a537119a6e7)

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

## Dataspcer XSD inconsistency

Dataspecer still does not support some features and has some known bugs In the meantime, after generating XSD files from datasoecer, the following changes must be done manually:

1. in geometry, add gml namespace, import gml, change gml element to ref=gml:AbstractFeature and add srsName to wkt
    ```
    xmlns:gml="http://www.opengis.net/gml/3.2"
    ```

   ``` 
   <xs:import namespace="http://www.opengis.net/gml/3.2"
      schemaLocation="http://schemas.opengis.net/gml/3.2.1/gml.xsd"/>
   ```

   ```
   <xs:element minOccurs="0" ref="gml:AbstractGeometry"
       sawsdl:modelReference="http://www.opengis.net/ont/geosparql#asGML">
       <xs:annotation>
         <xs:documentation xml:lang="en">GML - Representation of
               geometry object as GML Literal.</xs:documentation>
       </xs:annotation>
   </xs:element>
   ```

   ```   
   <xs:element minOccurs="0" name="wkt"
   sawsdl:modelReference="http://www.opengis.net/ont/geosparql#asWKT">
       <xs:annotation>
         <xs:documentation xml:lang="en"> WKT - Representation of geometry
           object as WKT Literal.</xs:documentation>
       </xs:annotation>
       <xs:complexType>
         <xs:simpleContent>
           <xs:extension base="xs:string">
             <xs:attribute name="srsName" type="xs:anyURI" use="optional"/>
           </xs:extension>
         </xs:simpleContent>
       </xs:complexType>
    </xs:element>
    ```
1. in location, add gml namespace, import gml and change bounding-box type to gml:EnvelopeType
   ```
   xmlns:gml="http://www.opengis.net/gml/3.2"
   ```

   ``` 
   <xs:import namespace="http://www.opengis.net/gml/3.2"
      schemaLocation="http://schemas.opengis.net/gml/3.2.1/gml.xsd"/>
   ```

   ```
   <xs:element minOccurs="0" maxOccurs="unbounded" name="bounding_box" type="gml:EnvelopeType"
    sawsdl:modelReference="http://www.w3.org/ns/dcat#bbox">
     <xs:annotation>
       <xs:documentation xml:lang="en"> bounding box - Bounding box of the location geometry.
       </xs:documentation>
     </xs:annotation>
   </xs:element>
   ```

# Text search



This operation retrieves CodeSystem concepts based on text search parameters. The data elements of a concept that can be considered for text search include:

* [`concept.display`](http://hl7.org/fhir/codesystem-definitions.html#CodeSystem.concept.display) The label. A single entry.
* [`concept.designation`](http://hl7.org/fhir/codesystem-definitions.html#CodeSystem.concept.designation) Additional use and language specific concept representations. Multiple entries.
* [`concept.definition`](http://hl7.org/fhir/codesystem-definitions.html#CodeSystem.concept.definition) The concept definition. A single entry.

The [`concept.property`](http://hl7.org/fhir/codesystem-definitions.html#CodeSystem.property) entries are considered structured data and not text searched. 
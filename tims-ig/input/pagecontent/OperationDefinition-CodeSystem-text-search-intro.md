# Text search

This is a work in progress FHIR Operation definition to specify a rich text search capability for the CodeSystem resource. A subset of this specification can later be reused to specify a similar text search use case for ValueSets.

Feedback and comments are welcome [here](https://github.com/HOT-Ecosystem/hapi-issues/issues/102)

This operation retrieves CodeSystem concepts based on text search parameters. The data elements of a concept that can be considered for text search include:
* [`concept.display`](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.concept.display) The label. A single entry.
* [`concept.designation`](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.concept.designation) Additional use and language specific concept representations. Multiple entries.
* [`concept.definition`](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.concept.definition) The concept definition. A single entry.

The [`concept.property`](http://hl7.org/fhir/R4/codesystem-definitions.html#CodeSystem.property) entries are considered structured data and not considered for text search purposes.

The scope and type of search can be specified by:
* Invoking the `baseurl/CodeSystem` endpoint to search over one or more CodeSystems and their versions.
* Invoking the `baseurl/CodeSystem/{id}` endpoint to search within a specific version of a CodeSystem.
* Possible Operation input parameters (note: need to review composite parameters and refactor this list):
  * `text` the search text.
  * `mode` the text search mode. See below.
  * `query` the search query from a query language.
  * `codesystem`: one or more CodeSystem `url`s, with or without a version qualifier.
  * `display`: boolean to indicate `concept.display` based search. Default?
  * `language`: the `concept.designation.language` to consider during search.
  * `use`: the `concept.designation.use` to consider during search.
  * `definition`: boolean to indicate `concept.definition` based search.

There are several text search approaches to improve finding matches, or to help with a specific use case. The approaches affect the indexing of the text in order to be able to use such approaches. These include:
* Phrase search. A match is based on full phrases. For example, this would allow for a search for an exact concept label match, with or without some normalization. 
* Word search. A match is based on full words with possible normalization and filtering of such words. This implies converting the full text into individual words in the index.
* n-gram search. This allows for searching with a fragment of the text. This is useful for auto-completion use cases.
* n-gram on word or phrase boundaries.  As above but the n-gram is fixed to the start or end of a word or phrase.
* phonetic search.



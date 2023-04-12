Instance: text-search
InstanceOf: http://hl7.org/fhir/StructureDefinition/OperationDefinition
Title: "Text search operation"
Description: "Text search description"
Usage: #definition
* name = "Text search name"
* title = "Text search operation"
* status = #draft
* kind = #operation
* code = #text-search
* resource = #CodeSystem
* system = false
* type = true
* instance = true
* parameter[+].name = #text
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The text to search for."
* parameter[=].type = #string



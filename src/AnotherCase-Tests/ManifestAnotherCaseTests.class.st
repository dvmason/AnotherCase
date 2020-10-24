"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAnotherCaseTests,
	#superclass : #PackageManifest,
	#category : #'AnotherCase-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestAnotherCaseTests class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SwitchTest)) #'2020-10-24T09:35:08.827363-04:00') )
]

{ #category : #'code-critics' }
ManifestAnotherCaseTests class >> ruleReGlobalVariablesUsageRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SwitchTest)) #'2020-10-23T09:26:59.548703-04:00') )
]

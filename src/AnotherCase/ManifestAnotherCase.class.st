"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAnotherCase,
	#superclass : #PackageManifest,
	#category : #'AnotherCase-Manifest'
}

{ #category : #'code-critics' }
ManifestAnotherCase class >> ruleEqualsTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Switch #if:do: #false)) #'2020-10-24T09:19:19.746752-04:00') )
]

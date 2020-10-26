"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAnotherCase,
	#superclass : #PackageManifest,
	#category : #'AnotherCase-Manifest'
}

{ #category : #'code-critics' }
ManifestAnotherCase class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SequenceableCollection #applyPredicates: #false)) #'2020-10-26T14:55:15.474286-04:00') #(#(#RGMethodDefinition #(#Association #applyPredicates: #false)) #'2020-10-26T15:03:11.752099-04:00') )
]

{ #category : #'code-critics' }
ManifestAnotherCase class >> ruleEqualsTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Switch #if:do: #false)) #'2020-10-24T09:19:19.746752-04:00') )
]

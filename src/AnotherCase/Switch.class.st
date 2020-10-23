"
I implement a switch statement. See the tests for example uses.
"
Class {
	#name : #Switch,
	#superclass : #Object,
	#instVars : [
		'key',
		'done',
		'result'
	],
	#category : #AnotherCase
}

{ #category : #'instance creation' }
Switch >> case: val do: block [
	done ifFalse: [
		key = val ifTrue: [
			result := block value.
			done := true]].
	^ result
]

{ #category : #'instance creation' }
Switch >> caseOneOf: aCollection do: aBlock [
	done ifFalse: [
		aCollection do: [:each |
			key = each ifTrue: [
				result := aBlock value.
				done := true.
				^ result]]].
	^ result
]

{ #category : #'instance creation' }
Switch >> if: aBoolean do: aBlock [
	done ifFalse: [
		aBoolean ifTrue: [
			result := aBlock value.
			done := true]].
	^ result
]

{ #category : #'instance creation' }
Switch >> initialize [
	done := false.

]

{ #category : #'instance creation' }
Switch >> otherwise: aBlock [
	done ifFalse: [
	result := (aBlock isBlock and: [ aBlock argumentCount = 1 ]) ifTrue: [
			aBlock value: key
		] ifFalse: [
			aBlock value
		].
		done := true].
	^ result
]

{ #category : #'instance creation' }
Switch >> with: val [
   key := val.
   done := false
]

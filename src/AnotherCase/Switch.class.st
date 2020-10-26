"
I implement a switch statement.

It is very flexible. You can match values, lists of values, boolean expressions, predicate symbols, predicate blocks

See the tests for example uses.
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

{ #category : #'matching - testing' }
Switch >> case: val do: block [
	done ifTrue: [ ^ result ].
	key = val ifTrue: [
		result := key apply: block.
		done := true].
	^ result
]

{ #category : #'matching - testing' }
Switch >> caseOneOf: aCollection do: aBlock [
	done ifTrue: [ ^ result ].
	aCollection do: [:each |
		key = each ifTrue: [
			done := true.
			^ result := key apply: aBlock ]].
	^ result
]

{ #category : #'matching - testing' }
Switch >> if: anObject do: doBlock [
	done ifTrue: [ ^ result ].
	anObject == false ifTrue: [ ^ result ].
	anObject == true ifTrue: [
		result := key apply: doBlock.
		done := true].
	(anObject isSymbol ifTrue: [
			anObject value: key
		] ifFalse: [
			anObject isClass ifTrue: [
				key isKindOf: anObject
			] ifFalse: [
				anObject isCollection and: [ key applyPredicates: anObject ]
		]]) ifTrue: [
			result := key apply: doBlock.
			done := true].
	^ result
]

{ #category : #initialization }
Switch >> initialize [
	done := false.

]

{ #category : #'matching - testing' }
Switch >> match: testBlock do: doBlock [
	done ifTrue: [ ^ result ].
	(key applyTest: testBlock) ifTrue: [
		result := key apply: doBlock.
		done := true].
	^ result
]

{ #category : #'matching - testing' }
Switch >> otherwise: aBlock [
	done ifTrue: [ ^ result ].
	done := true.
	^ result := key apply: aBlock
]

{ #category : #'instance creation' }
Switch >> with: val [
   key := val.
   done := false
]

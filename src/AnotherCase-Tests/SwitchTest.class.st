Class {
	#name : #SwitchTest,
	#superclass : #TestCase,
	#category : #'AnotherCase-Tests'
}

{ #category : #tests }
SwitchTest >> testBlocks [
	self assert: (1 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 13.
	self assert: (3 switch
		case: 1 do: [ 3+10];
		case: 3 do: [: v | v+39 ];
		otherwise: 17) equals: 42.
	self assert: (2 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: [: v | v+15 ]) equals: 17.

]

{ #category : #tests }
SwitchTest >> testCond [
	self assert: (Switch new
		if: 6 squared > 25 do: [ 1 ];
		if: 12 negated < 10 do: [ 2 ];
		otherwise: [ 3 ]) equals: 1.
	self assert: (Switch new
		if: 5 squared > 25 do: [ 1 ];
		if: 12 negated < 10 do: [ 2 ];
		otherwise: [ 3 ]) equals: 2.
	self assert: (Switch new
		if: 5 squared > 25 do: [ 1 ];
		if: -12 negated < 10 do: [ 2 ];
		otherwise: [ 3 ]) equals: 3.

]

{ #category : #tests }
SwitchTest >> testMatch [
	self assert: ((1->2) switch
		match: [: l : r | l = 1 and: [ r = 2 ] ] do: [: l : r | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 3.
	self assert: (3 switch
		match: [: l : r | l = 1 ] do: [: l : r | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: ((1->2) switch
		match: [: l : r | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: [: l : r | l+r]) equals: 3.
	self assert: ((1->2) switch
		match: [: l : r | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: #yourself) equals: 1->2.

]

{ #category : #tests }
SwitchTest >> testMatchArray [
	| array |
	Smalltalk at: #Tuple ifAbsent: [ ^ self ].
	array := #(1 2 3).
	self assert: (array switch
		match: [: l : r : x | l = 1 and: [ r = 2 ] ] do: [: l : r : x | l+r+x];
		case: 3 do: 42;
		otherwise: 17) equals: 6.
	self assert: (3 switch
		match: [: l : r : x | l = 1 ] do: [: l : r | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: (array switch
		match: [: l : r : x | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: [: l : r : x | l+r]) equals: 3.
	self assert: (array switch
		match: [: l : r : x | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: #yourself) equals: array.

]

{ #category : #tests }
SwitchTest >> testMatchPair [
	| pairClass pair |
	pairClass := Smalltalk at: #Pair ifAbsent: [ ^ self ].
	pair := pairClass with: 1 with: 2.
	self assert: (pair switch
		match: [: l : r | l = 1 and: [ r = 2 ] ] do: [: l : r | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 3.
	self assert: (3 switch
		match: [: l : r | l = 1 ] do: [: l : r | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: (pair switch
		match: [: l : r | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: [: l : r | l+r]) equals: 3.
	self assert: (pair switch
		match: [: l : r | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: #yourself) equals: pair.

]

{ #category : #tests }
SwitchTest >> testMatchTuple [
	| tupleClass tuple |
	tupleClass := Smalltalk at: #Tuple ifAbsent: [ ^ self ].
	tuple := tupleClass with: 1 with: 2 with: 3.
	self assert: (tuple switch
		match: [: l : r : x | l = 1 and: [ r = 2 ] ] do: [: l : r : x | l+r+x];
		case: 3 do: 42;
		otherwise: 17) equals: 6.
	self assert: (3 switch
		match: [: l : r : x | l = 1 ] do: [: l : r | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: (tuple switch
		match: [: l : r : x | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: [: l : r : x | l+r]) equals: 3.
	self assert: (tuple switch
		match: [: l : r : x | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: #yourself) equals: tuple.

]

{ #category : #tests }
SwitchTest >> testSimple [
	self assert: (1 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 13.
	self assert: (3 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: (2 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 17.

]

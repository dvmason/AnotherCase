Class {
	#name : #SwitchTest,
	#superclass : #TestCase,
	#category : #'AnotherCase-Tests'
}

{ #category : #tests }
SwitchTest >> testArray [
	| array |
	array := #(1 2 3).
	self assert: (array switch
		match: [: l : r : x | l = 1 and: [ r = 2 ] ] do: [: l : r : x | l+r+x];
		case: 3 do: 42;
		otherwise: 17) equals: 6.
	self assert: (3 switch
		match: [: l : r : x | l = 1 ] do: [: l : r : x | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: (array switch
		match: [: l : r : x | false ] do: [: l : r : x | 17];
		case: 3 do: 42;
		otherwise: [: l : r : x | l+r]) equals: 3.
	self assert: (array switch
		match: [: l : r | false ] do: [: l : r | 99];
		match: [: l : r : x | false ] do: [: l : r : x | 17];
		case: 3 do: 42;
		otherwise: #yourself) equals: array.
	self assert: (array switch
		if: #(isString isNumber) do: [: l : r | 17];
		if: #(isString isNumber isNumber) do: [: l : r : x | 17];
		if: #(isNumber isNumber isNumber) do: [: l : r : x | r];
		case: 3 do: 42;
		otherwise: #yourself) equals: 2.

]

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
SwitchTest >> testPair [
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
		match: [: l : r : x | false ] do: [: l : r : x | 17];
		match: [: l : r | false ] do: [: l : r | 17];
		case: 3 do: 42;
		otherwise: #yourself) equals: pair.
	self assert: (pair switch
		if: #(isString isNumber) do: [: l : r | 17];
		if: #(isNumber isNumber) do: [: l : r | r];
		case: 3 do: 42;
		otherwise: #yourself) equals: 2.

]

{ #category : #tests }
SwitchTest >> testPredicates [
	self assert: (7 switch
		if: 5 squared > 25 do: [ 1 ];
		if: #isNumber do: [: v | v negated ];
		otherwise: [ 3 ]) equals: -7.
	self assert: ((3->7) switch
		if: 5 squared > 25 do: [ 1 ];
		if: #isNumber do: [: v | v negated ];
		if: #(isNumber isString) do: [: k : v | 99 ];
		if: #(isNumber isNumber) do: [: k : v | v negated ];
		otherwise: [ 3 ]) equals: -7.

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

{ #category : #tests }
SwitchTest >> testTuple [
	| tupleClass tuple |
	tupleClass := Smalltalk at: #Tuple ifAbsent: [ ^ self ].
	tuple := tupleClass with: 1 with: 2 with: 3.
	self assert: (tuple switch
		match: [: l : r : x | l = 1 and: [ r = 2 ] ] do: [: l : r : x | l+r+x];
		case: 3 do: 42;
		otherwise: 17) equals: 6.
	self assert: (3 switch
		match: [: l : r : x | l = 1 ] do: [: l : r : x | l+r];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: (tuple switch
		match: [: l : r : x | false ] do: [: l : r : x | 17];
		case: 3 do: 42;
		otherwise: [: l : r : x | l+r]) equals: 3.
	self assert: (tuple switch
		match: [: l : r | false ] do: [: l : r | 99];
		match: [: l : r : x | false ] do: [: l : r : x | 17];
		case: 3 do: 42;
		otherwise: #yourself) equals: tuple.
	self assert: (tuple switch
		if: #(isString isNumber) do: [: l : r | 17];
		if: #(isString isNumber isNumber) do: [: l : r : x | 17];
		if: #(isNumber isNumber isNumber) do: [: l : r : x | r];
		case: 3 do: 42;
		otherwise: #yourself) equals: 2.

]

"
A CTUnbalancedSetTest is a test class for testing the behavior of CTUnbalancedSet
"
Class {
	#name : #CTUnbalancedSetTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-RedBlackSet-Tests'
}

{ #category : #asserting }
CTUnbalancedSetTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #tests }
CTUnbalancedSetTest >> testPushDoubledObject [

	| set representation |
	set := (1 to: 10) shuffled asUnbalancedSet.
	representation := set representation.

	self exportSlotsGraphOf: set pathSuffix: 'original'.

	set
		push: 1;
		push: 5;
		push: 10.

	self assert: set representation equals: representation.

	set push: 0.

	self deny: set representation equals: representation.

	^ self exportSlotsGraphOf: set pathSuffix: 'augmented'
]

{ #category : #tests }
CTUnbalancedSetTest >> tree: aCollection [

	^ aCollection asUnbalancedSet
]

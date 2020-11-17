Class {
	#name : #CTBinaryTreeEmptyUnbalanced,
	#superclass : #CTBinaryTreeEmpty,
	#category : #'Containers-RedBlackSet'
}

{ #category : #testing }
CTBinaryTreeEmptyUnbalanced >> includes: anObject witness: aWitness inSet: aSet [
	^ aSet is: anObject equalTo: aWitness
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyUnbalanced >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	^ (aSet is: anObject equalTo: aWitness)
		  ifTrue: [ aContinuation value: aSet representation ]
		  ifFalse: [ aSet binaryTreeElementLeaf: anObject ]
]

Class {
	#name : #CTBinaryTreeEmptyRedBlack,
	#superclass : #CTBinaryTreeEmptyUnbalanced,
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyRedBlack >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	| repr |
	repr := super
		        push: anObject
		        witness: aWitness
		        continuation: aContinuation
		        inSet: aSet.
	^ repr
		  value: (aSet node: repr value color: RedNode);
		  yourself
]

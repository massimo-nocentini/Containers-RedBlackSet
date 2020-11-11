Class {
	#name : #CTRedBlackSet,
	#superclass : #CTUnbalancedSet,
	#category : #'Containers-RedBlackSet'
}

{ #category : #requirements }
CTRedBlackSet class >> emptyTreeClass [
	^ CTBinaryTreeEmptyBalanced
]

{ #category : #requirements }
CTRedBlackSet class >> nodeTreeClass [
	^ CTBinaryTreeNodeBalancedRed
]

{ #category : #adding }
CTRedBlackSet >> push: anObject [
	super push: anObject.
	representation := representation asBlackNode
]

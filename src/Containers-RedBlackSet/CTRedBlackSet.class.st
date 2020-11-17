Class {
	#name : #CTRedBlackSet,
	#superclass : #CTUnbalancedSet,
	#category : #'Containers-RedBlackSet'
}

{ #category : #creating }
CTRedBlackSet >> binaryTreeElementEmpty [
	^ CTBinaryTreeEmptyBalanced new
]

{ #category : #creating }
CTRedBlackSet >> binaryTreeElementNode [
	^ CTBinaryTreeNodeBalancedRed new
]

{ #category : #adding }
CTRedBlackSet >> push: anObject [
	super push: anObject.
	representation := representation asBlackNode
]

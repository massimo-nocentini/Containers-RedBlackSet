"
A CTUnbalancedSetTest is a test class for testing the behavior of CTUnbalancedSet
"
Class {
	#name : #CTUnbalancedSetTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-RedBlackSet-Tests'
}

{ #category : #initialization }
CTUnbalancedSetTest >> setUp [

	super setUp.

	treeClass := CTUnbalancedSet
]

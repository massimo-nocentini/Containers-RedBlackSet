"
A CTUnbalancedSetTest is a test class for testing the behavior of CTUnbalancedSet
"
Class {
	#name : #CTUnbalancedSetTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-RedBlackSet-Tests'
}

{ #category : #tests }
CTUnbalancedSetTest >> tree: aCollection [

	^ aCollection asUnbalancedSet
]

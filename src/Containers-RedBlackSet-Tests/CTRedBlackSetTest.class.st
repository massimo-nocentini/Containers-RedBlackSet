"
A CTRedBlackSetTest is a test class for testing the behavior of CTRedBlackSet
"
Class {
	#name : #CTRedBlackSetTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-RedBlackSet-Tests'
}

{ #category : #asserting }
CTRedBlackSetTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #tests }
CTRedBlackSetTest >> tree: aCollection [

	^ aCollection asRedBlackSet
]

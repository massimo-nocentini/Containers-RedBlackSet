Class {
	#name : #CTUnbalancedSet,
	#superclass : #CTBinaryTreeAbstract,
	#category : #'Containers-RedBlackSet'
}

{ #category : #creating }
CTUnbalancedSet >> binaryTreeElementEmpty [
	^ CTBinaryTreeEmptyUnbalanced new
]

{ #category : #creating }
CTUnbalancedSet >> binaryTreeElementNode [
	^ CTBinaryTreeNodeUnbalanced new
]

{ #category : #adding }
CTUnbalancedSet >> includes: anObject [
	^ representation
		  includes: anObject
		  witness: Object new
		  inSet: self
]

{ #category : #adding }
CTUnbalancedSet >> push: anObject [
	representation := [ :hop | 
	                  representation
		                  push: anObject
		                  witness: Object new
		                  continuation: hop
		                  inSet: self ] callWithCurrentContinuation
]

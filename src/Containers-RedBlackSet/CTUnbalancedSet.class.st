Class {
	#name : #CTUnbalancedSet,
	#superclass : #CTBinaryTreeAbstract,
	#traits : 'TContainerSet',
	#classTraits : 'TContainerSet classTrait',
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTUnbalancedSet class >> complete: anObject depth: anInteger [
	| block tree |
	block := [ :l :r | 
	         self nodeTreeClass left: l value: anObject right: r ].
	tree := (1 to: anInteger)
		        inject: nil
		        into: [ :t :_ | block value: t value: t ].
	^ self new
		  representation: tree;
		  yourself
]

{ #category : #requirements }
CTUnbalancedSet class >> empty [
	^ self new
		  representation: self emptyTreeClass new;
		  yourself
]

{ #category : #requirements }
CTUnbalancedSet class >> emptyTreeClass [
	^ CTBinaryTreeEmptyUnbalanced
]

{ #category : #requirements }
CTUnbalancedSet class >> nodeTreeClass [
	^ CTBinaryTreeNodeUnbalanced
]

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

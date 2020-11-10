Class {
	#name : #CTUnbalancedSet,
	#superclass : #Object,
	#traits : 'TContainerSet',
	#classTraits : 'TContainerSet classTrait',
	#instVars : [
		'representation'
	],
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTUnbalancedSet class >> complete: anObject depth: anInteger [
	| block tree |
	block := [ :l :r | 
	         CTBinaryTreeAbstract left: l value: anObject right: r ].
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
		  representation: CTBinaryTreeEmpty new;
		  yourself
]

{ #category : #adding }
CTUnbalancedSet >> inDoubleLinkRepresentation: aDoubleLink includes: anObject witness: aWitness [
	| aRefinedWitness |
	aRefinedWitness := aDoubleLink value.
	^ (self is: anObject lessThan: aRefinedWitness)
		  ifTrue: [ 
			  aDoubleLink previousLink
				  includes: anObject
				  witness: aWitness
				  inSet: self ]
		  ifFalse: [ 
			  aDoubleLink nextLink
				  includes: anObject
				  witness: aRefinedWitness
				  inSet: self ]
]

{ #category : #adding }
CTUnbalancedSet >> inDoubleLinkRepresentation: aDoubleLink push: anObject witness: aWitness continuation: aContinuation [
	| aRefinedWitness leftLink rightLink newLink |
	aRefinedWitness := aDoubleLink value.
	leftLink := aDoubleLink previousLink.
	rightLink := aDoubleLink nextLink.
	^ (self is: anObject lessThan: aRefinedWitness)
		  ifTrue: [ 
			  newLink := leftLink
				             push: anObject
				             witness: aWitness
				             continuation: aContinuation
				             inSet: self.
			  CTBinaryTreeNode
				  left: newLink
				  value: aRefinedWitness
				  right: rightLink ]
		  ifFalse: [ 
			  newLink := rightLink
				             push: anObject
				             witness: aRefinedWitness
				             continuation: aContinuation
				             inSet: self.
			  CTBinaryTreeNode
				  left: leftLink
				  value: aRefinedWitness
				  right: newLink ]
]

{ #category : #adding }
CTUnbalancedSet >> inNilRepresentation: _ includes: anObject witness: aWitness [
	^ self is: anObject equalTo: aWitness
]

{ #category : #adding }
CTUnbalancedSet >> inNilRepresentation: _ push: anObject witness: aWitness continuation: aContinuation [
	^ (self is: anObject equalTo: aWitness)
		  ifTrue: [ aContinuation value: representation ]
		  ifFalse: [ 
			  CTBinaryTreeNode
				  left: CTBinaryTreeEmpty new
				  value: anObject
				  right: CTBinaryTreeEmpty new ]
]

{ #category : #adding }
CTUnbalancedSet >> includes: anObject [
	^ representation
		  includes: anObject
		  witness: Object new
		  inSet: self
]

{ #category : #adding }
CTUnbalancedSet >> is: anObject equalTo: aRefinedWitness [
	^ anObject = aRefinedWitness
]

{ #category : #adding }
CTUnbalancedSet >> is: anObject lessThan: aRefinedWitness [
	^ anObject < aRefinedWitness
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

{ #category : #accessing }
CTUnbalancedSet >> representation [
	^ representation
]

{ #category : #accessing }
CTUnbalancedSet >> representation: anObject [
	representation := anObject
]

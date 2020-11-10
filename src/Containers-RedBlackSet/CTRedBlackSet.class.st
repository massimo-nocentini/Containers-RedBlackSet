Class {
	#name : #CTRedBlackSet,
	#superclass : #CTUnbalancedSet,
	#category : #'Containers-RedBlackSet'
}

{ #category : #requirements }
CTRedBlackSet class >> emptyTreeClass [
	^ CTBinaryTreeEmptyRedBlack
]

{ #category : #requirements }
CTRedBlackSet class >> nodeTreeClass [
	^ CTBinaryTreeNodeRedBlack
]

{ #category : #adding }
CTRedBlackSet >> is: anObject equalTo: aRefinedWitness [
	^ anObject = aRefinedWitness value
]

{ #category : #adding }
CTRedBlackSet >> is: anObject lessThan: aRefinedWitness [
	^ anObject < aRefinedWitness value
]

{ #category : #adding }
CTRedBlackSet >> node: x color: aColorClass [
	^ aColorClass new
		  value: x;
		  yourself
]

{ #category : #adding }
CTRedBlackSet >> push: anObject [
	super push: anObject.
	representation value: representation value asBlackNode
]

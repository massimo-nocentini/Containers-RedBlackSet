Class {
	#name : #CTBinaryTreeNodeRedBlack,
	#superclass : #CTBinaryTreeNodeUnbalanced,
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeRedBlack >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	| repr |
	repr := super
		        push: anObject
		        witness: aWitness
		        continuation: aContinuation
		        inSet: aSet.
	^ repr value
		  balance: [ :A :x :B :y :C :z :D | 
			  | L R |
			  L := aSet class nodeTreeClass
				       left: A
				       value: (aSet node: x color: BlackNode)
				       right: B.
			  R := aSet class nodeTreeClass
				       left: C
				       value: (aSet node: z color: BlackNode)
				       right: D.
			  aSet class nodeTreeClass
				  left: L
				  value: (aSet node: y color: RedNode)
				  right: R ]
		  representation: repr
]

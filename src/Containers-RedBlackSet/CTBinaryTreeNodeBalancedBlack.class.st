Class {
	#name : #CTBinaryTreeNodeBalancedBlack,
	#superclass : #CTBinaryTreeNodeBalanced,
	#category : #'Containers-RedBlackSet'
}

{ #category : #converting }
CTBinaryTreeNodeBalancedBlack >> asBlackNode [
	^ self
]

{ #category : #converting }
CTBinaryTreeNodeBalancedBlack >> asShape [

	^ super asShape
		  color: Color black;
		  yourself
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeBalancedBlack >> balance: aBlock representation: aDoubleLink [
	| args |
	args := Continuation
		        tries: { 
				        [ :skip | 
				        self balanceLeftLeftTreeOf: aDoubleLink continuation: skip ].
				        [ :skip | 
				        self
					        balanceLeftRightTreeOf: aDoubleLink
					        continuation: skip ].
				        [ :skip | 
				        self
					        balanceRightLeftTreeOf: aDoubleLink
					        continuation: skip ].
				        [ :skip | 
				        self
					        balanceRightRightTreeOf: aDoubleLink
					        continuation: skip ] }
		        otherwise: [ nil ].
	^ args
		  ifNil: [ aDoubleLink ]
		  ifNotNil: [ aBlock valueWithArguments: args ]
]

{ #category : #dispatching }
CTBinaryTreeNodeBalancedBlack >> balanceLeftLeftTreeOf: aDoubleLink continuation: skip [
	^ aDoubleLink previousLink ifNil: skip ifNotNil: [ :L | 
		  L balanceLeftTreeOf: L leftTreeOf: aDoubleLink continuation: skip ]
]

{ #category : #dispatching }
CTBinaryTreeNodeBalancedBlack >> balanceLeftRightTreeOf: aDoubleLink continuation: skip [
	^ aDoubleLink previousLink ifNil: skip ifNotNil: [ :L | 
		  L balanceRightTreeOf: L leftTreeOf: aDoubleLink continuation: skip ]
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceLeftTreeOf: aDoubleLink leftTreeOf: aDoubleLink2 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceLeftTreeOf: aDoubleLink rightTreeOf: aDoubleLink2 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #dispatching }
CTBinaryTreeNodeBalancedBlack >> balanceRightLeftTreeOf: aDoubleLink continuation: skip [
	^ aDoubleLink nextLink ifNil: skip ifNotNil: [ :R | 
		  R balanceLeftTreeOf: R rightTreeOf: aDoubleLink continuation: skip ]
]

{ #category : #dispatching }
CTBinaryTreeNodeBalancedBlack >> balanceRightRightTreeOf: aDoubleLink continuation: skip [
	^ aDoubleLink nextLink ifNil: skip ifNotNil: [ :R | 
		  R
			  balanceRightTreeOf: R
			  rightTreeOf: aDoubleLink
			  continuation: skip ]
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceRightTreeOf: aDoubleLink leftTreeOf: aDoubleLink2 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceRightTreeOf: aDoubleLink rightTreeOf: aDoubleLink2 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceTree: aDoubleLink leftTreeOf: aDoubleLink2 leftTreeOf: aDoubleLink3 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceTree: aDoubleLink leftTreeOf: aDoubleLink2 rightTreeOf: aDoubleLink3 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceTree: aDoubleLink rightTreeOf: aDoubleLink2 leftTreeOf: aDoubleLink3 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #dispatched }
CTBinaryTreeNodeBalancedBlack >> balanceTree: aDoubleLink rightTreeOf: aDoubleLink2 rightTreeOf: aDoubleLink3 continuation: aContinuation [
	^ aContinuation value
]

{ #category : #accessing }
CTBinaryTreeNodeBalancedBlack >> color [
	^ Color black
]

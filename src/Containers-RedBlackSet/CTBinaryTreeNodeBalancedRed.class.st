Class {
	#name : #CTBinaryTreeNodeBalancedRed,
	#superclass : #CTBinaryTreeNodeBalanced,
	#category : #'Containers-RedBlackSet'
}

{ #category : #converting }
CTBinaryTreeNodeBalancedRed >> asBlackNode [
	^ CTBinaryTreeNodeBalancedBlack new
		  previousLink: previousLink;
		  value: value;
		  nextLink: nextLink;
		  yourself
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeBalancedRed >> balance: aBlock representation: aDoubleLink [
	^ aDoubleLink
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceLeftTreeOf: L leftTreeOf: aDoubleLink continuation: skip [
	^ L previousLink ifNil: skip ifNotNil: [ :LL | 
		  LL
			  balanceTree: LL
			  leftTreeOf: L
			  leftTreeOf: aDoubleLink
			  continuation: skip ]
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceLeftTreeOf: R rightTreeOf: aDoubleLink continuation: skip [
	^ R previousLink ifNil: skip ifNotNil: [ :RL | 
		  RL
			  balanceTree: RL
			  leftTreeOf: R
			  rightTreeOf: aDoubleLink
			  continuation: skip ]
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceRightTreeOf: L leftTreeOf: aDoubleLink continuation: skip [
	^ L nextLink ifNil: skip ifNotNil: [ :LR | 
		  LR
			  balanceTree: LR
			  rightTreeOf: L
			  leftTreeOf: aDoubleLink
			  continuation: skip ]
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceRightTreeOf: R rightTreeOf: aDoubleLink continuation: skip [
	^ R nextLink ifNil: skip ifNotNil: [ :RR | 
		  RR
			  balanceTree: RR
			  rightTreeOf: R
			  rightTreeOf: aDoubleLink
			  continuation: skip ]
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceTree: LL leftTreeOf: L leftTreeOf: aDoubleLink continuation: skip [
	self assert: value == LL value.
	^ { 
		  LL previousLink.
		  value.
		  LL nextLink.
		  L value.
		  L nextLink.
		  aDoubleLink value.
		  aDoubleLink nextLink }
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceTree: RL leftTreeOf: R rightTreeOf: aDoubleLink continuation: skip [
	self assert: value == RL value.
	^ { 
		  aDoubleLink previousLink.
		  aDoubleLink value.
		  RL previousLink.
		  value.
		  RL nextLink.
		  R value.
		  R nextLink }
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceTree: LR rightTreeOf: L leftTreeOf: aDoubleLink continuation: skip [
	self assert: value == LR value.
	^ { 
		  L previousLink.
		  L value.
		  LR previousLink.
		  value.
		  LR nextLink.
		  aDoubleLink value.
		  aDoubleLink nextLink }
]

{ #category : #enumerating }
CTBinaryTreeNodeBalancedRed >> balanceTree: RR rightTreeOf: R rightTreeOf: aDoubleLink continuation: skip [
	self assert: value == RR value.
	^ { 
		  aDoubleLink previousLink.
		  aDoubleLink value.
		  R previousLink.
		  R value.
		  RR previousLink.
		  value.
		  RR nextLink }
]

{ #category : #accessing }
CTBinaryTreeNodeBalancedRed >> color [
	^ Color red
]

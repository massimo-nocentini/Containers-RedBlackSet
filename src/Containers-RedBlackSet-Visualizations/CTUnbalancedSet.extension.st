Extension { #name : #CTUnbalancedSet }

{ #category : #'*Containers-RedBlackSet-Visualizations' }
CTUnbalancedSet >> asSlotsGroupKnownReferences: anIdentitySet [
	| aGroup rearGroup frontAndRearLinks rearComposite meShape |
	aGroup := super asSlotsGroupKnownReferences:
		          anIdentitySet | (Array streamContents: [ :aStream | 
			           representation ifNotNil: [ 
				           aStream nextPut: representation ] ]).
	rearGroup := representation
		             ifNil: [ RSGroup new ]
		             ifNotNil: [ 
		             representation asSlotsGroupRecursiveKnownReferences:
			             anIdentitySet ].
	frontAndRearLinks := RSEdgeBuilder arrowedLine
		                     color: Color gray;
		                     toShapes:
			                     ({ (rearGroup shapeFromModel: representation) } 
				                      reject: #isNil);
		                     fromShapes:
			                     { (aGroup shapeFromModel: representation) };
		                     useAssociations:
			                     { representation asReflexiveAssociation }.
	rearComposite := rearGroup asShapeFor: representation.
	meShape := aGroup asShapeFor: self.
	RSVerticalLineLayout new
		alignCenter;
		applyOn: { 
				meShape.
				rearComposite }.
	^ (RSGroup new
		   add: meShape;
		   add: rearComposite;
		   addAll: frontAndRearLinks;
		   yourself) @ RSDraggable
]

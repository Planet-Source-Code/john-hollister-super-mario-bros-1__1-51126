Attribute VB_Name = "saveload"
Global groundTile(-5 To 500, 0 To 15) As Integer
Global objectTile(-5 To 500, 0 To 15) As Integer
Global backTile(-5 To 500, 0 To 15) As Integer
Global enemyTile(-5 To 500, -2 To 15) As Integer




Public Sub saveMap(mname As String)
Open App.Path & "\" & mname & ".txt" For Output As 1
For b = 0 To 500
    For a = 0 To 15
        Write #1, groundTile(b, a), backTile(b, a), objectTile(b, a), enemyTile(b, a)
    Next a
Next b
Close
End Sub


Public Sub loadMap(level As String)
        Open App.Path & "\" & level & ".txt" For Input As 1
        
        For b = 0 To 500
            For a = 0 To 15
                Input #1, groundTile(b, a), backTile(b, a), objectTile(b, a), enemyTile(b, a)
            Next a
        Next b
        Close
        
        
End Sub



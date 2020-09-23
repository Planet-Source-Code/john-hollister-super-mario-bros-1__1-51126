Attribute VB_Name = "levelMod"
'this will hold all level info in arrays so there's no file I/O
'they will be called by getLevel(level as integer)
Global groundTile(-5 To 500, 0 To 15) As Integer
Global objectTile(-5 To 500, 0 To 15) As Integer
Global backTile(-5 To 500, 0 To 15) As Integer
Global enemyTile(-5 To 500, -2 To 15) As Integer
Global levelAsBit(-112 To 10000, -112 To 272) As Integer
Global esetdir(0 To 35) As Integer 'this is for presetting all enemy directions



Public Sub getLevel(level As String)
    Dim a As Integer 'counter var
    
    Select Case level
        'load level 1-1 arrays
        Case "11"
        'mariofrm.gameFrame.BackColor = vbBlack
        Open App.Path & "\levelEditor\" & level & ".txt" For Input As 1
        
        For b = 0 To 500
            For a = 0 To 15
                Input #1, groundTile(b, a), backTile(b, a), objectTile(b, a), enemyTile(b, a)
            Next a
        Next b
        Close
        'preset all enemy directions
        esetdir(0) = 1
        For a = 0 To 35
            esetdir(a) = -1
        Next a
        
        
        
        
    End Select
    For a = -5 To 500
        For b = 0 To 15
            If groundTile(a, b) <> 0 Or objectTile(a, b) <> 0 Then
                For c = 0 To 15
                    For d = 0 To 16
                        levelAsBit((a * 16) + c, (b * 16) + d) = 1
                    Next d
                Next c
            End If
        Next b
    Next a



End Sub

'this stuff just hard codes a level, i don't use it
Public Sub something()
            For a = -3 To 500
                'set groundtile equal to bitblt picture offset
                groundTile(a, 14) = 2
                groundTile(a, 15) = 2
            Next a

            'pits!
            groundTile(57, 14) = 0
            groundTile(57, 15) = 0
            groundTile(56, 14) = 0
            groundTile(56, 15) = 0

            
            'GOOMBA
            enemyTile(15, 13) = 1
            enemyTile(25, 13) = 1
            
            
            'hills
            backTile(11, 13) = 1
            backTile(12, 13) = 3
            backTile(13, 13) = 2
            backTile(12, 12) = 4
            
            backTile(52, 13) = 1
            backTile(53, 13) = 3
            backTile(54, 13) = 2
            backTile(53, 12) = 4
            
            
            'bushes
            backTile(18, 13) = 9
            backTile(19, 13) = 10
            
            backTile(9, 13) = 10
            backTile(8, 13) = 9
            backTile(7, 13) = 10
            backTile(6, 13) = 9

            
            'clouds
            backTile(14, 4) = 5
            backTile(15, 4) = 6
            backTile(14, 5) = 7
            backTile(15, 5) = 8
           
            
            
            
            'bricks
            objectTile(15, 10) = 1
            objectTile(17, 10) = 1
            objectTile(19, 10) = 1
            
            'question blocks-- what inside?!?!?
            objectTile(16, 10) = 2
            objectTile(18, 10) = 2
            objectTile(17, 6) = 2
            objectTile(11, 10) = 2
            
            
            'pipes
            objectTile(23, 12) = 6
            objectTile(24, 12) = 7
            objectTile(23, 13) = 8
            objectTile(24, 13) = 9
            
            objectTile(31, 11) = 6
            objectTile(32, 11) = 7
            objectTile(31, 12) = 8
            objectTile(32, 12) = 9
            objectTile(31, 13) = 8
            objectTile(32, 13) = 9

            objectTile(36, 10) = 6
            objectTile(37, 10) = 7
            objectTile(36, 11) = 8
            objectTile(37, 11) = 9
            objectTile(36, 12) = 8
            objectTile(37, 12) = 9
            objectTile(36, 13) = 8
            objectTile(37, 13) = 9
            
            objectTile(44, 10) = 6
            objectTile(45, 10) = 7
            objectTile(44, 11) = 7
            objectTile(45, 11) = 8
            objectTile(44, 12) = 7
            objectTile(45, 12) = 8
            objectTile(44, 13) = 7
            objectTile(45, 13) = 8
        
End Sub

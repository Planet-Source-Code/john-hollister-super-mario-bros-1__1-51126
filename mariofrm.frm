VERSION 5.00
Begin VB.Form mariofrm 
   Caption         =   "Mario"
   ClientHeight    =   5445
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4515
   LinkTopic       =   "Form1"
   ScaleHeight     =   5445
   ScaleWidth      =   4515
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox gameFrame 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FF8080&
      Height          =   3825
      Left            =   240
      ScaleHeight     =   3765
      ScaleWidth      =   4020
      TabIndex        =   0
      Top             =   240
      Visible         =   0   'False
      Width           =   4080
   End
   Begin VB.Label Label2 
      Caption         =   "Label1"
      Height          =   255
      Left            =   2400
      TabIndex        =   2
      Top             =   4800
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   255
      Left            =   960
      TabIndex        =   1
      Top             =   4800
      Width           =   1095
   End
End
Attribute VB_Name = "mariofrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function GetTickCount Lib "kernel32" () As Long


'tells how far through the level you are
Private walkoffset As Integer
'makes mario walk
Private walkCtr As Integer
Private enemyWalkCtr
Private levelComplete As Boolean



Private enemyList(0 To 35) As Enemy

'# of enemies in level
Private numEnemies As Integer

Private goodieList(0 To 55) As Goods

'# of goodies in the level
Private numGoodies As Integer


Private coins As Double
Private qcount As Integer
Private endjump As Integer
Private jumped As Boolean
Private groundBelow As Boolean
Private isStuck As Boolean
Private gravity As Double
Private speed As Double
Private inAir As Boolean
Private jumpVal As Double
Private lastTime As Long
Private holdJump As Integer
Private origY As Integer
Private leveloffset As Integer
Private goingUp As Boolean
Private mDir As Integer
Private time As Double
Private currx As Integer 'these will let me know mario's approximate location, not bitwise
Private curry As Integer

'front line for mario's collision detection
Private mx1 As Integer, mx2 As Integer, my1 As Integer, my2 As Integer



'these are for speed control


Private Sub Form_Load()
Me.Show
gameFrame.Visible = True
coins = 0


Call initializeVars
Call drawNextLevel
Call gameLoop


End Sub

Function getControls()
Label1.Caption = endjump

Label2.Caption = origY


    'mario stands when not running
    If GetAsyncKeyState(vbKeyRight) = 0 And GetAsyncKeyState(vbKeyLeft) = 0 And inAir = False Then
        walkCtr = 0
        If Abs(speed) > 0 Then
            If speed > 0 Then speed = speed - 0.5
            If speed < 0 Then speed = speed + 0.5
        End If
    End If

    'press the right key
    If GetAsyncKeyState(vbKeyRight) <> 0 And GetAsyncKeyState(vbKeyLeft) = 0 Then
        mDir = 0
        If GetAsyncKeyState(vbKeyControl) <> 0 Then
            If speed < 5 Then speed = speed + 0.25
        Else
            If speed < 4 Then speed = speed + 0.25
        End If
        walkCtr = (walkCtr + Abs(Int(speed))) Mod 16
        If speed < 0 Then speed = speed + 0.25
    End If
    

    If GetAsyncKeyState(vbKeyLeft) <> 0 And GetAsyncKeyState(vbKeyRight) = 0 Then
        mDir = 1
        If GetAsyncKeyState(vbKeyControl) <> 0 Then
            If speed > -5 Then speed = speed - 0.25
        Else
            If speed > -4 Then speed = speed - 0.25
        End If
        If speed > 0 Then speed = speed - 0.25
        walkCtr = (walkCtr + Abs(Int(speed))) Mod 16
    End If
    
    
    Dim canwalk As Boolean
    
    If speed < 0 Then
        For a = 0 To Int(Abs(speed))
            canwalk = True
            If levelAsBit(walkoffset - a - 16, my1) Or levelAsBit(walkoffset - a - 16, my2 - 4) Then
                canwalk = False
                speed = 0
                a = 6
            End If
        Next a
        If canwalk Then
            If mx1 >= 15 And isStuck = False Then
                walkoffset = walkoffset + Int(speed)
                mx1 = mx1 + Int(speed)
            End If
        End If
    End If
    If speed > 0 Then
        For a = 0 To Int(speed)
            canwalk = True
            If levelAsBit(walkoffset + a, my1) Or levelAsBit(walkoffset + a, my2 - 4) Then
                canwalk = False
                speed = 0
                a = 6
            End If
        Next a
        If canwalk Then
            walkoffset = walkoffset + Int(speed)
            'screen won't scroll until mario is back at the middle of it
            If mx1 < 127 And isStuck = False Then
                mx1 = mx1 + Int(speed)
            Else
                leveloffset = leveloffset + Int(speed)
            End If
        End If
    End If
    
    
    If GetAsyncKeyState(vbKeySpace) <> 0 And my2 Mod 16 = 15 Then
        If inAir = False Then origY = my2
        jumped = True
        inAir = True
        If my2 = origY And groundBelow Then
            gravity = -8
            endjump = origY - 64
            'give mario a boost if run key is held while jumping
            If GetAsyncKeyState(vbKeyControl) <> 0 And Abs(speed) > 4 Then
                gravity = -8
                endjump = origY - 80
            End If
            goingUp = True
        End If
        groundBelow = False
    End If

End Function


Function drawNextLevel()
'draws the entire map!


'draw floor
For b = 0 To 15
    For a = 0 To 199
        If groundTile(a, b) <> 0 Then
            BitBlt gameFrame.hDC, (a * 16), (b * 16), 16, 16, pictures.floor.hDC, 16, 0&, vbSrcAnd
            BitBlt gameFrame.hDC, (a * 16), (b * 16), 16, 16, pictures.floor.hDC, 16, 0&, vbSrcPaint
        End If
        If objectTile(a, b) <> 0 Then
            BitBlt gameFrame.hDC, (a * 16), (b * 16), 16, 16, pictures.block.hDC, 0, 0&, vbSrcAnd
            BitBlt gameFrame.hDC, (a * 16), (b * 16), 16, 16, pictures.block.hDC, 0, 0&, vbSrcPaint
        End If
    Next a
Next b

'how far through the level are you
walkoffset = 127

'draw mario
BitBlt gameFrame.hDC, (7 * 16), (13 * 16), 16, 16, pictures.walk.hDC, 0, 0&, vbSrcPaint
BitBlt gameFrame.hDC, (7 * 16), (13 * 16), 16, 16, pictures.walk.hDC, 32, 0&, vbSrcAnd
End Function


Function gameLoop()

Do

    'is mario at the end of the level?
    If currx >= 198 Then levelComplete = True
    
    T = GetTickCount + 30
    If levelComplete Then
        'have to change the level here (it's just hardcoded now)
        Call getLevel(11)
        Call initializeVars
        Call drawNextLevel
        levelComplete = False
    End If
    

    
    
    'make enemies look like they're walking
    enemyWalkCtr = (enemyWalkCtr + 1) Mod 32

    
    'calculate mario's x,y values
    Dim off As Integer
    currx = Int((walkoffset - 15) / 16)
    off = (walkoffset - 15) Mod 16
    'more of half of mario is in next block
    If off > 7 Then
        currx = currx + 1
    End If
    
    curry = Int(my1 / 16)
    off = my1 Mod 16
    If off > 7 Then
        curry = curry + 1
    End If
    
    
    
    '********************************
    'test for a collision
    '********************************
    Call checkMarioCollision
    
    '********************************
    'check player controls
    '********************************
    Call getControls

    '********************************
    'draw graphics
    '********************************
    Call drawGraphics
    
    
    '********************************
    'update info on top of screen
    '********************************
    Call drawInfo

    
    '********************************
    'make gravity
    '********************************
    Call makeGravity
    
    gameFrame.Refresh
        
    While T > GetTickCount
        DoEvents
    Wend
            gameFrame.Cls
    'Label1.Caption = 1000 / (GetTickCount - lastTime)
    lastTime = GetTickCount

Loop Until levelComplete



End Function

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Function makeGravity()
    'update location on screen of mario
    If inAir Then
        my2 = (origY + jumpVal)
        my1 = my2 - 15
    End If
    
    'slow mario for parabolic arc on way up
    If my2 <= endjump + 8 And gravity < 0 Then
        gravity = Int(gravity / 2)
    End If

    'parabolic arc on way down.
    If gravity > 0 And gravity < 8 Then
        gravity = gravity * 2
    End If
    
    'at peak of jump. start to go down
    If my2 = endjump Then
        goingUp = False
        gravity = 0.5
    End If
    
    'where is mario in his jump
    jumpVal = jumpVal + Int(gravity + 0.5)

End Function


Function checkMarioCollision()
        mx2 = mx1 - 15
        my1 = my2 - 15
        
        
        'down a pit........
        '--------------------------
        If my2 > 271 Then
            'will be current level..
            Call getLevel(11)
            Call initializeVars
            Call drawNextLevel
        End If
        
        Dim toff As Integer
        If mDir = 0 Then
            toff = 0
        Else
            toff = -15
        End If
            
        currx = Int((walkoffset) / 16)
        curry = Int(my1 / 16)

        'see if mario hits his head on a jump
        '------------------------------------
        If (levelAsBit(walkoffset, my1 - 1) Or levelAsBit(walkoffset - 15, my1 - 1)) And inAir Then
            
            'isStuck = True
            'was it a question block??
            If objectTile(currx, curry) = 2 Then
                'make box unhittable
                'is it a shroom?
                'If goodies(currx, curry) = 1 Then
                '    Call goodieList(numGoodies).makeGoodie(1, 1, currx * 16, (curry - 1) * 16)
                '   numGoodies = numGoodies + 1
                'End If
                
                coins = coins + 1
                objectTile(currx, curry) = 10
            ElseIf objectTile(currx - 1, curry) = 2 And walkoffset Mod 16 < 12 Then
                coins = coins + 1
                objectTile(currx - 1, curry) = 10
            ElseIf objectTile(currx + 1, curry) = 2 And walkoffset Mod 16 < 4 Then
                coins = coins + 1
                objectTile(currx + 1, curry) = 10
            End If
            

            
            'was it a brick??
            'make it break if mario is big
            
            
            'was there a baddie on top of the brick?
            
            
            'start the fall.....
            gravity = 8
            'jumpVal = jumpVal + 1
            'this code just patches up mario's movement so he won't twitch around
            goingUp = False
        End If
        
        
        
        'test if ground is underneath
        '--------------------------------
        If levelAsBit(walkoffset - 2, my2 + 1) = 1 Or levelAsBit(walkoffset - 14, my2 + 1) = 1 Then
            jumped = False
            groundBelow = True
            If goingUp = False Then
                gravity = 0
                jumpVal = 0
                origY = my2
                inAir = False
                If my2 Mod 16 <> 15 Then
                   voff = my2 Mod 16
                    my2 = my2 - voff - 1
                    origY = my2
                End If
            End If
        Else
            inAir = True
            If jumped = False And goingUp = False Then gravity = 8 'start a drop
        End If


End Function

Function drawGraphics()
    'makes ? blocks change color
    qcount = (qcount + 1) Mod 36
    '*****************************************
    'Draw board
    '*****************************************
    For b = 0 To 15
        For a = Int((leveloffset) / 16) - 3 To Int((leveloffset) / 16) + 17
            'draw backgrounds
            If backTile(a, b) <> 0 Then
                BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.backGround.hDC, ((backTile(a, b) - 1) * 16) + (10 * 16), 0&, vbSrcAnd
                BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.backGround.hDC, ((backTile(a, b) - 1) * 16), 0&, vbSrcPaint
            End If
            'draw ground
            If groundTile(a, b) <> 0 Then '-------v  change that for run vs walk
                BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.floor.hDC, 16 + (9 * 16), 0&, vbSrcAnd
                BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.floor.hDC, 16, 0&, vbSrcPaint
            End If
            'draw bricks, pipes, other objects
            If objectTile(a, b) <> 0 Then
                If objectTile(a, b) = 2 Then
                    BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.block.hDC, ((objectTile(a, b) + Int(qcount / 12) - 1) * 16) + (11 * 16), 0&, vbSrcAnd
                    BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.block.hDC, ((objectTile(a, b) + Int(qcount / 12) - 1) * 16), 0&, vbSrcPaint
                Else
                    BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.block.hDC, ((objectTile(a, b) - 1) * 16) + (11 * 16), 0&, vbSrcAnd
                    BitBlt gameFrame.hDC, (a * 16) - (leveloffset), (b * 16), 16, 16, pictures.block.hDC, ((objectTile(a, b) - 1) * 16), 0&, vbSrcPaint
                End If
            End If
        Next a
    Next b
    
    Dim c As Integer
    c = 0
    For b = 0 To 199
        For a = 0 To 15
            
            '****************************
            'draw goodies
            '****************************
            If b = Int(goodieList(0).xloc / 16) And a = Int(goodieList(0).yloc / 16) Then
                Call goodieList(0).moveMe
                BitBlt gameFrame.hDC, goodieList(0).xloc - (leveloffset), goodieList(0).yloc, 16, 16, pictures.goodies.hDC, 0, 16, vbSrcAnd
                BitBlt gameFrame.hDC, goodieList(0).xloc - (leveloffset), goodieList(0).yloc, 16, 16, pictures.goodies.hDC, 0, 0, vbSrcPaint
            End If

            '****************************
            'draw enemies
            '****************************
            If b >= -3 And c <= numEnemies And enemyTile(b, a) >= 1 Then
                'goomba movement
                If enemyList(c).alive = True Then
                'mario stomps enemy
                'enemy is hit by turtle shell
                    'make enemies wait for mario until they move
                    If enemyList(c).xloc - (currx * 16) < (20 * 16) Then Call enemyList(c).moveMe
                    
                    'did a turtle shell hit another enemy?
                    If enemyTile(b, a) = 3 Then
                        For e = 0 To numEnemies
                            If enemyList(c).xloc >= enemyList(e).xloc And enemyList(c).xloc <= enemyList(e).xloc + 15 And c <> e And enemyList(c).yloc >= enemyList(e).yloc - 14 And enemyList(c).speed <> 0 Then
                                enemyList(e).alive = False
                            End If
                        Next e
                    End If

                    If (my1 >= enemyList(c).yloc And my2 <= enemyList(c).yloc + 15) And (walkoffset >= enemyList(c).xloc And walkoffset < enemyList(c).xloc + 25) Then
                        If enemyTile(b, a) <> 3 Then
                            Call getLevel("11")
                            Call initializeVars
                            Call drawNextLevel
                            gameFrame.Cls
                        ElseIf (enemyTile(b, a) = 3 And enemyList(c).speed <> 0) Then
                            If (walkoffset > enemyList(c).xloc + 16 - speed And enemyList(c).speed > 0) Or (walkoffset < enemyList(c).xloc + 16 + speed And enemyList(c).speed < 0) Then
                                Call getLevel("11")
                                Call initializeVars
                                Call drawNextLevel
                                gameFrame.Cls
                            End If
                        Else
                        
                            'mario kicks the turtle shell
                            If walkoffset > enemyList(c).xloc + 16 - speed Then
                                enemyList(c).speed = -7
                            ElseIf walkoffset < enemyList(c).xloc + 16 + speed Then
                                enemyList(c).speed = 7
                            End If
                        End If
                    'mario stomps the bejesus out of an enemy
                    ElseIf my2 <= enemyList(c).yloc + 16 And my2 > enemyList(c).yloc And inAir Then
                        If (my1 <= enemyList(c).yloc) And (walkoffset >= enemyList(c).xloc And walkoffset < enemyList(c).xloc + 25) Then
                            'is the enemy a turtle? turn it to a turtle shell
                            jumped = True
                            goingUp = True
                            gravity = -8
                            jumpVal = 0
                            origY = my2
                            endjump = my2 - 32
                            'make the turtle a turtle shell here
                            If enemyTile(b, a) = 2 Then
                                enemyTile(b, a) = 3
                                enemyList(c).speed = 0
                                my2 = my2 - 8
                                jumpVal = jumpVal + gravity
                            ElseIf enemyTile(b, a) <> 3 Then
                                enemyList(c).alive = False
                            End If
                        End If
                    End If
                    BitBlt gameFrame.hDC, enemyList(c).xloc - (leveloffset), enemyList(c).yloc - 8, 16, 24, pictures.enemies.hDC, ((enemyTile(b, a) - 1) * 32) + (Int(enemyWalkCtr / 16) * 16) + (6 * 16), 0&, vbSrcAnd
                    BitBlt gameFrame.hDC, enemyList(c).xloc - (leveloffset), enemyList(c).yloc - 8, 16, 24, pictures.enemies.hDC, ((enemyTile(b, a) - 1) * 32) + (Int(enemyWalkCtr / 16) * 16), 0&, vbSrcPaint
                End If
                c = c + 1
            End If
        Next a
    Next b
    '*********************************************
    'draw mario
    '*********************************************
    'these will have to change-v-------v  X changes if mario is behind scroll -> line and y changes when falling for jumping
    If inAir Then   'he jumps
        BitBlt gameFrame.hDC, mx2, my1, 16, 16, pictures.walk.hDC, 32 + 48, mDir * 16, vbSrcAnd
        BitBlt gameFrame.hDC, mx2, my1, 16, 16, pictures.walk.hDC, 32, mDir * 16, vbSrcPaint
    Else
        BitBlt gameFrame.hDC, mx2, my1, 16, 16, pictures.walk.hDC, (Int(walkCtr / 8) * 16) + 48, mDir * 16, vbSrcAnd
        BitBlt gameFrame.hDC, mx2, my1, 16, 16, pictures.walk.hDC, (Int(walkCtr / 8) * 16) + 0, mDir * 16, vbSrcPaint
    End If
End Function

Function drawInfo()
    'score board
    BitBlt gameFrame.hDC, 15, 15, 40, 8, pictures.info.hDC, 0, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 15, 15, 40, 8, pictures.info.hDC, 0, 0, vbSrcPaint
    
    'coins
    BitBlt gameFrame.hDC, 96, 28, 14, 8, pictures.info.hDC, 40, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 96, 28, 14, 8, pictures.info.hDC, 40, 0, vbSrcPaint
    Dim cointens As Integer, coinones As Integer
    cointens = Int(Int(coins) / 10)
    coinones = (Int(coins)) Mod 10
    BitBlt gameFrame.hDC, 115, 28, 8, 8, pictures.numbers.hDC, (cointens * 8) - 1, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 115, 28, 8, 8, pictures.numbers.hDC, (cointens * 8) - 1, 0, vbSrcPaint
    BitBlt gameFrame.hDC, 124, 28, 8, 8, pictures.numbers.hDC, (coinones * 8) - 1, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 124, 28, 8, 8, pictures.numbers.hDC, (coinones * 8) - 1, 0, vbSrcPaint
    
    
    
    'world
    BitBlt gameFrame.hDC, 145, 15, 40, 8, pictures.info.hDC, 53, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 145, 15, 40, 8, pictures.info.hDC, 53, 0, vbSrcPaint
    


    'time
    BitBlt gameFrame.hDC, 215, 15, 32, 8, pictures.info.hDC, 93, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 215, 15, 32, 8, pictures.info.hDC, 93, 0, vbSrcPaint
    time = time - 33.3  '33fps
    Dim tottime As Integer, timehund As Integer, timeten As Integer, timeone As Integer
    tottime = Int(time / 1000)
    timehund = Int(tottime / 100)
    tottime = tottime - (timehund * 100)
    timeten = Int(tottime / 10)
    timeone = tottime Mod 10
    
    BitBlt gameFrame.hDC, 215, 28, 8, 8, pictures.numbers.hDC, (timehund * 8) - 1, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 215, 28, 8, 8, pictures.numbers.hDC, (timehund * 8) - 1, 0, vbSrcPaint
    BitBlt gameFrame.hDC, 223, 28, 8, 8, pictures.numbers.hDC, (timeten * 8) - 1, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 223, 28, 8, 8, pictures.numbers.hDC, (timeten * 8) - 1, 0, vbSrcPaint
    BitBlt gameFrame.hDC, 231, 28, 8, 8, pictures.numbers.hDC, (timeone * 8) - 1, 8, vbSrcAnd
    BitBlt gameFrame.hDC, 231, 28, 8, 8, pictures.numbers.hDC, (timeone * 8) - 1, 0, vbSrcPaint
    

End Function


Function initializeVars()
mx1 = 127
my2 = 223

goingUp = False
gravity = 0
speed = 2
T = 0
holdJump = 0
inAir = False

time = 300000

lastTime = GetTickCount

leveloffset = 0
mDir = 0
groundBelow = True

currx = 8
curry = 13

levelComplete = False
Call getLevel("11")
                    
    
    Set goodieList(numGoodies) = New Goods


    Dim c As Integer
    c = 0
    For b = 0 To 199
        For a = 0 To 15
            If enemyTile(b, a) <> 0 Then
                Set enemyList(c) = New Enemy
                Call enemyList(c).makeEnemy(enemyTile(b, a), esetdir(c), b * 16, a * 16)
                c = c + 1
            End If
        Next a
    Next b
    
    'save num of enemies
    numEnemies = c - 1
    
End Function





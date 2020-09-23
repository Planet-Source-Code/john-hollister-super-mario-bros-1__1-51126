VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Enemy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public xloc As Integer, yloc As Integer
Public speed As Integer
Public alive As Boolean
Private id As String

'this is the constructor
Public Sub makeEnemy(name As Integer, sp As Integer, xl As Integer, yl As Integer)
    If name = 1 Then
        id = "goomba"
    ElseIf name = 2 Then
        id = "turtle"
    End If
    speed = sp
    xloc = xl
    yloc = yl
    alive = True
End Sub



Public Sub moveMe()
If alive Then
    'proceed forward
    xloc = xloc + speed
    
    'enemy bumps into something
    If levelAsBit(xloc, yloc) Or levelAsBit(xloc + 15, yloc) Or levelAsBit(xloc, yloc + 15) Or levelAsBit(xloc + 15, yloc + 15) Then
        speed = -speed
    End If
    
    'enemy is falling
    If levelAsBit(xloc + 15, yloc + 16) = 0 And levelAsBit(xloc, yloc + 16) = 0 Then yloc = yloc + 4
    If yloc > 255 Then alive = False
        
    
    'kill enemy if it goes too far off screen
    If xloc < -92 Then
        alive = False
    End If
End If
End Sub


'returns whether or not enemy is alive
Public Function isAlive() As Boolean
    isAlive = False
End Function


VERSION 5.00
Begin VB.Form back 
   Caption         =   "Form1"
   ClientHeight    =   8505
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   11130
   LinkTopic       =   "Form1"
   ScaleHeight     =   8505
   ScaleWidth      =   11130
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command1 
      Caption         =   "Load"
      Height          =   255
      Left            =   10080
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   7680
      Width           =   735
   End
   Begin VB.TextBox mapname 
      Height          =   285
      Left            =   8760
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   7680
      Width           =   975
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   4
      Left            =   0
      Picture         =   "levelEditor.frx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   3
      Left            =   360
      Picture         =   "levelEditor.frx":0C42
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   8
      Left            =   6600
      Picture         =   "levelEditor.frx":1884
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   7
      Left            =   6960
      Picture         =   "levelEditor.frx":24C6
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   10
      Left            =   5280
      Picture         =   "levelEditor.frx":3108
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   9
      Left            =   5760
      Picture         =   "levelEditor.frx":3D4A
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   375
   End
   Begin VB.Label Label10 
      Caption         =   "turtle"
      Height          =   255
      Left            =   7680
      TabIndex        =   11
      Top             =   7560
      Width           =   735
   End
   Begin VB.Image enemy 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   1
      Left            =   7680
      Picture         =   "levelEditor.frx":498C
      Stretch         =   -1  'True
      Top             =   7200
      Width           =   375
   End
   Begin VB.Label Label9 
      Caption         =   "solid block"
      Height          =   255
      Left            =   5280
      TabIndex        =   10
      Top             =   7320
      Width           =   855
   End
   Begin VB.Image enemy 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   0
      Left            =   7680
      Picture         =   "levelEditor.frx":55CE
      Stretch         =   -1  'True
      Top             =   7800
      Width           =   375
   End
   Begin VB.Label Label8 
      Caption         =   "goomba"
      Height          =   255
      Left            =   7560
      TabIndex        =   9
      Top             =   8160
      Width           =   735
   End
   Begin VB.Label Label7 
      Caption         =   "erase"
      Height          =   255
      Left            =   9000
      TabIndex        =   7
      Top             =   7320
      Width           =   495
   End
   Begin VB.Image eraser 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   9000
      Top             =   6960
      Width           =   375
   End
   Begin VB.Label Label6 
      Caption         =   "mapName"
      Height          =   255
      Left            =   8880
      TabIndex        =   6
      Top             =   8040
      Width           =   855
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   6
      Left            =   6960
      Picture         =   "levelEditor.frx":6210
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   5
      Left            =   6600
      Picture         =   "levelEditor.frx":6E52
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   2
      Left            =   5880
      Picture         =   "levelEditor.frx":7A94
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   1
      Left            =   5520
      Picture         =   "levelEditor.frx":86D6
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image object 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   0
      Left            =   5160
      Picture         =   "levelEditor.frx":9318
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Label Label5 
      Caption         =   "bush"
      Height          =   255
      Left            =   3960
      TabIndex        =   4
      Top             =   8040
      Width           =   735
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   9
      Left            =   4320
      Picture         =   "levelEditor.frx":9F5A
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   8
      Left            =   3960
      Picture         =   "levelEditor.frx":AB9C
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Label Label4 
      Caption         =   "clouds"
      Height          =   255
      Left            =   3000
      TabIndex        =   3
      Top             =   8040
      Width           =   735
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   7
      Left            =   3360
      Picture         =   "levelEditor.frx":B7DE
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   6
      Left            =   3000
      Picture         =   "levelEditor.frx":C420
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   5
      Left            =   3360
      Picture         =   "levelEditor.frx":D062
      Stretch         =   -1  'True
      Top             =   7200
      Width           =   375
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   4
      Left            =   3000
      Picture         =   "levelEditor.frx":DCA4
      Stretch         =   -1  'True
      Top             =   7200
      Width           =   375
   End
   Begin VB.Label Label3 
      Caption         =   "hills"
      Height          =   255
      Left            =   1920
      TabIndex        =   2
      Top             =   8040
      Width           =   735
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   3
      Left            =   2040
      Picture         =   "levelEditor.frx":E8E6
      Stretch         =   -1  'True
      Top             =   7200
      Width           =   375
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   2
      Left            =   2040
      Picture         =   "levelEditor.frx":F528
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   1
      Left            =   2400
      Picture         =   "levelEditor.frx":1016A
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Label Label2 
      Caption         =   "floors"
      Height          =   255
      Left            =   480
      TabIndex        =   1
      Top             =   7200
      Width           =   735
   End
   Begin VB.Image back 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   0
      Left            =   1680
      Picture         =   "levelEditor.frx":10DAC
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Label Label1 
      Caption         =   "current"
      Height          =   255
      Left            =   10320
      TabIndex        =   0
      Top             =   6960
      Width           =   615
   End
   Begin VB.Image current 
      Height          =   495
      Left            =   10320
      Top             =   6360
      Width           =   495
   End
   Begin VB.Image floor 
      Height          =   375
      Index           =   1
      Left            =   960
      Picture         =   "levelEditor.frx":119EE
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   375
   End
   Begin VB.Image floor 
      Height          =   360
      Index           =   0
      Left            =   480
      Picture         =   "levelEditor.frx":12630
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   360
   End
   Begin VB.Image tile 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   0
      Left            =   0
      Picture         =   "levelEditor.frx":13272
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Menu savethemap 
      Caption         =   "save"
   End
End
Attribute VB_Name = "back"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public laytype As Integer
Public layval As Integer
Private Const GRD = 0
Private Const EN = 1
Private Const BACKG = 2
Private Const OBJ = 3
Private Const ERS = 4




Private Sub Command1_Click()
    Call loadMap(mapname.Text)
    For a = 0 To 199
        For b = 0 To 15
            If backTile(a, b) <> 0 Then
                tile((200 * b) + a).Picture = back(backTile(a, b) - 1).Picture
            End If
            If groundTile(a, b) <> 0 Then
                tile((200 * b) + a).Picture = floor(groundTile(a, b) - 1).Picture
            End If
            If objectTile(a, b) <> 0 Then
                tile((200 * b) + a).Picture = object(objectTile(a, b) - 1).Picture
            End If
            If enemyTile(a, b) <> 0 Then
                tile((200 * b) + a).Picture = enemy(enemyTile(a, b) - 1).Picture
            End If
        Next b
    Next a
    
    
End Sub

Private Sub enemy_Click(Index As Integer)
    laytype = EN
    layval = Index
    current.Picture = enemy(Index).Picture
    Label1.Caption = "goomba"
End Sub

Private Sub eraser_Click()
    laytype = ERS
     current.Picture = eraser.Picture
    Label1.Caption = "eraser"
   
End Sub

Private Sub mapname_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyRight Then

        For a = 0 To 199
            For b = 0 To 15
                Dim tmp As Integer
                tmp = ((b * 200) + a)
                tile(tmp).Visible = False
            Next b
        Next a
        For a = 0 To 199
            For b = 0 To 15
                tmp = ((b * 200) + a)
                tile(tmp).Left = tile(tmp).Left - 240
                tile(tmp).Visible = True
            Next b
        Next a
    End If
End Sub

Private Sub object_Click(Index As Integer)
    laytype = OBJ
    layval = Index
    current.Picture = object(Index).Picture
    Label1.Caption = "object"
End Sub

Private Sub back_Click(Index As Integer)
    laytype = BACKG
    layval = Index
    current.Picture = back(Index).Picture
    Label1.Caption = "background"

End Sub



Private Sub floor_Click(Index As Integer)
    laytype = GRD
    layval = Index
    current.Picture = floor(Index).Picture
    Label1.Caption = "floor"
End Sub

Private Sub Form_Load()
    For a = 0 To 199
        For b = 0 To 15
            Dim tmp As Integer
            tmp = ((b * 200) + a)
            If tmp <> 0 Then
                Load tile(tmp)
            End If
            tile(tmp).Left = a * 240
            tile(tmp).Top = b * 240
            tile(tmp).Visible = True
        Next b
    Next a
    For a = 0 To 199
        For b = 14 To 15
            groundTile(a, b) = 2
            tile((b * 200) + a).Picture = floor(1).Picture
        Next b
    Next a
    
End Sub



Private Sub savethemap_Click()
    Call saveMap(mapname.Text)
End Sub

Private Sub tile_Click(Index As Integer)
    Dim row As Integer
    Dim col As Integer
    col = Index Mod 200
    row = Int(Index / 200)
    
    If laytype = GROUND Then
        groundTile(col, row) = layval + 1
    ElseIf laytype = EN Then
        enemyTile(col, row) = layval + 1
    ElseIf laytype = BACKG Then
        backTile(col, row) = layval + 1
    ElseIf laytype = OBJ Then
        objectTile(col, row) = layval + 1
    ElseIf laytype = ERS Then
        groundTile(col, row) = 0
        enemyTile(col, row) = 0
        backTile(col, row) = 0
        objectTile(col, row) = 0
    End If
    
    
    tile(Index).Picture = current.Picture
    
End Sub

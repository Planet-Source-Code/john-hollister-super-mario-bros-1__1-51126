VERSION 5.00
Begin VB.Form pictures 
   Caption         =   "Form2"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6945
   LinkTopic       =   "Form2"
   ScaleHeight     =   3195
   ScaleWidth      =   6945
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox goodies 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   540
      Left            =   3720
      Picture         =   "pictures.frx":0000
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   80
      TabIndex        =   7
      Top             =   600
      Width           =   1260
   End
   Begin VB.PictureBox numbers 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   300
      Left            =   360
      Picture         =   "pictures.frx":1E42
      ScaleHeight     =   16
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   80
      TabIndex        =   6
      Top             =   120
      Width           =   1260
   End
   Begin VB.PictureBox info 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   300
      Left            =   1680
      Picture         =   "pictures.frx":2D84
      ScaleHeight     =   16
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   128
      TabIndex        =   5
      Top             =   840
      Width           =   1980
   End
   Begin VB.PictureBox enemies 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   420
      Left            =   120
      Picture         =   "pictures.frx":45C6
      ScaleHeight     =   24
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   192
      TabIndex        =   4
      Top             =   2280
      Width           =   2940
   End
   Begin VB.PictureBox backGround 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   300
      Left            =   120
      Picture         =   "pictures.frx":7C08
      ScaleHeight     =   240
      ScaleWidth      =   4800
      TabIndex        =   3
      Top             =   1920
      Width           =   4860
   End
   Begin VB.PictureBox block 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   300
      Left            =   120
      Picture         =   "pictures.frx":B84A
      ScaleHeight     =   16
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   352
      TabIndex        =   2
      Top             =   1560
      Width           =   5340
   End
   Begin VB.PictureBox floor 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   300
      Left            =   120
      Picture         =   "pictures.frx":FA8C
      ScaleHeight     =   240
      ScaleWidth      =   4320
      TabIndex        =   1
      Top             =   1200
      Width           =   4380
   End
   Begin VB.PictureBox walk 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   540
      Left            =   120
      Picture         =   "pictures.frx":130CE
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   96
      TabIndex        =   0
      Top             =   600
      Width           =   1500
   End
End
Attribute VB_Name = "pictures"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ѡ������"
   ClientHeight    =   3120
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6840
   BeginProperty Font 
      Name            =   "����"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "OPTIONS.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3120
   ScaleWidth      =   6840
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frmMisc 
      Caption         =   "����"
      Height          =   975
      Left            =   120
      TabIndex        =   11
      Top             =   1560
      Width           =   3255
      Begin VB.CheckBox chkAutoSave 
         Caption         =   "�Զ��������"
         Height          =   255
         Left            =   1680
         TabIndex        =   14
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkPromptSave 
         Caption         =   "��ʾ�������"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkShowNew 
         Caption         =   "����ʱ��ʾ����ʼ�Ծ֡��Ի���"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   3015
      End
   End
   Begin VB.Frame frmEngine 
      Caption         =   "����"
      Height          =   2415
      Left            =   3480
      TabIndex        =   15
      Top             =   120
      Width           =   3255
      Begin VB.TextBox txtMoveDelay 
         Height          =   285
         Left            =   960
         TabIndex        =   17
         Top             =   240
         Width           =   360
      End
      Begin VB.TextBox txtUser 
         Height          =   270
         Left            =   1680
         TabIndex        =   29
         Top             =   2040
         Width           =   1215
      End
      Begin VB.CheckBox chkStatusBar 
         Caption         =   "�����״̬��"
         Height          =   255
         Left            =   1680
         TabIndex        =   25
         Top             =   1320
         Width           =   1455
      End
      Begin VB.CheckBox chkEngineTime 
         Caption         =   "��ʾ˼��ʱ��"
         Height          =   255
         Left            =   120
         TabIndex        =   24
         Top             =   1320
         Width           =   1455
      End
      Begin VB.CheckBox chkAllowResign 
         Caption         =   "�����������"
         Height          =   255
         Left            =   1680
         TabIndex        =   23
         Top             =   960
         Width           =   1455
      End
      Begin VB.CheckBox chkAlwaysPonder 
         Caption         =   "���ú�̨˼��"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   960
         Width           =   1455
      End
      Begin VB.ComboBox cmbEnginePlay 
         Height          =   300
         Left            =   1680
         Style           =   2  'Dropdown List
         TabIndex        =   27
         Top             =   1680
         Width           =   1215
      End
      Begin VB.CheckBox chkAutoFlip 
         Caption         =   "�Զ���ת����"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkEngineName 
         Caption         =   "��ʾ��������"
         Height          =   255
         Left            =   1680
         TabIndex        =   21
         Top             =   600
         Width           =   1455
      End
      Begin ComCtl2.UpDown updnMoveDelay 
         Height          =   285
         Left            =   1320
         TabIndex        =   18
         Top             =   240
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   503
         _Version        =   327681
         Value           =   1
         BuddyControl    =   "txtMoveDelay"
         BuddyDispid     =   196614
         OrigLeft        =   2160
         OrigTop         =   240
         OrigRight       =   2355
         OrigBottom      =   495
         Max             =   5
         SyncBuddy       =   -1  'True
         BuddyProperty   =   65547
         Enabled         =   -1  'True
      End
      Begin VB.Label lblDelaySec 
         Caption         =   "��"
         Height          =   255
         Left            =   1560
         TabIndex        =   19
         Top             =   240
         Width           =   255
      End
      Begin VB.Label lblMoveDelay 
         Caption         =   "������ʱ"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblUser 
         Caption         =   "�˻������û�"
         Height          =   255
         Left            =   480
         TabIndex        =   28
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label lblEnginePlay 
         Caption         =   "�¾ֵ���״̬"
         Height          =   255
         Left            =   480
         TabIndex        =   26
         Top             =   1680
         Width           =   1095
      End
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "ȡ��"
      Height          =   375
      Left            =   3720
      TabIndex        =   31
      Top             =   2640
      Width           =   975
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "ȷ��"
      Default         =   -1  'True
      Height          =   375
      Left            =   2040
      TabIndex        =   30
      Top             =   2640
      Width           =   975
   End
   Begin VB.Frame frmGui 
      Caption         =   "���"
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3255
      Begin VB.OptionButton optSmallGui 
         Caption         =   "С"
         Height          =   255
         Left            =   600
         TabIndex        =   2
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton optLargeGui 
         Caption         =   "��"
         Height          =   255
         Left            =   1080
         TabIndex        =   3
         Top             =   240
         Width           =   495
      End
      Begin VB.CheckBox chkSounds 
         Caption         =   "����Ч��"
         Height          =   255
         Left            =   2040
         TabIndex        =   4
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label lblDisplay 
         Caption         =   "��ʾ"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame frmWizard 
      Caption         =   "ħ��"
      Height          =   615
      Left            =   120
      TabIndex        =   5
      Top             =   840
      Width           =   3255
      Begin ComCtl2.UpDown updnPlayIntv 
         Height          =   285
         Left            =   2640
         TabIndex        =   9
         Top             =   240
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   503
         _Version        =   327681
         Value           =   1
         BuddyControl    =   "txtPlayIntv"
         BuddyDispid     =   196635
         OrigLeft        =   2160
         OrigTop         =   240
         OrigRight       =   2355
         OrigBottom      =   495
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   65547
         Enabled         =   -1  'True
      End
      Begin VB.TextBox txtPlayIntv 
         Height          =   285
         Left            =   2280
         TabIndex        =   8
         Top             =   240
         Width           =   360
      End
      Begin VB.CheckBox chkAutoPlay 
         Caption         =   "�Զ�����"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label lblPlayIntv 
         Caption         =   "������ʱ"
         Height          =   255
         Left            =   1440
         TabIndex        =   7
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblIntvSec 
         Caption         =   "��"
         Height          =   255
         Left            =   2880
         TabIndex        =   10
         Top             =   240
         Width           =   255
      End
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' OPTIONS.FRM - Source Code for XiangQi Wizard, Part VII
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 4.5, Last Modified: Jan. 2010
' Copyright (C) 2004-2010 www.xqbase.com
'
' This program is free software; you can redistribute it and/or modify
' it under the terms of the GNU General Public License as published by
' the Free Software Foundation; either version 2 of the License, or
' (at your option) any later version.

' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.

' You should have received a copy of the GNU General Public License along
' with this program; if not, write to the Free Software Foundation, Inc.,
' 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Option Explicit

Private nPlayIntv As Integer, nMoveDelay As Integer

Private Sub Form_Load()

Dim i As Integer

cmbEnginePlay.Clear
cmbEnginePlay.AddItem L("�����õ���", "��������X��"), 0
cmbEnginePlay.AddItem L("����ִ��", "��X�̼t"), 1
cmbEnginePlay.AddItem L("����ִ��", "��X�̺�"), 2
cmbEnginePlay.AddItem L("�������", "�t��݆��"), 3
cmbEnginePlay.AddItem L("������", "�t���S�C"), 4

optSmallGui.Value = Not Options_bLargeGui
optLargeGui.Value = Options_bLargeGui
chkSounds.Value = IIf(Options_bSounds, 1, 0)
chkAutoPlay.Value = IIf(Options_bAutoPlay, 1, 0)
nPlayIntv = Options_nPlayIntv
txtPlayIntv.Text = nPlayIntv
nMoveDelay = Options_nMoveDelay
txtMoveDelay.Text = nMoveDelay
chkAutoFlip.Value = IIf(Options_bAutoFlip, 1, 0)
chkEngineName.Value = IIf(Options_bEngineName, 1, 0)
chkAlwaysPonder.Value = IIf(Options_bAlwaysPonder, 1, 0)
chkAllowResign.Value = IIf(Options_bAllowResign, 1, 0)
chkEngineTime.Value = IIf(Options_bEngineTime, 1, 0)
chkStatusBar.Value = IIf(Options_bStatusBar, 1, 0)
cmbEnginePlay.ListIndex = Options_nEnginePlay
txtUser.Text = Options_szUser
chkPromptSave.Value = IIf(Options_bPromptSave, 1, 0)
chkAutoSave.Value = IIf(Options_bAutoSave, 1, 0)
chkShowNew.Value = IIf(Options_bShowNew, 1, 0)
SetTopMost hWnd

If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If
Font.Charset = 136
Font.Name = "�����w"
On Error Resume Next
For i = 0 To Controls.Count - 1
    Controls(i).Font = Font
Next
On Error GoTo 0
Caption = "�x��O��"
frmGui.Caption = "���^"
lblDisplay.Caption = "�@ʾ"
optSmallGui.Caption = "С"
optLargeGui.Caption = "��"
chkSounds.Caption = "��Ч��"
frmWizard.Caption = "ħ��"
chkAutoPlay.Caption = "�ԄӲ���"
lblPlayIntv.Caption = "�����ӕr"
lblIntvSec.Caption = "��"
frmMisc.Caption = "����"
chkShowNew.Caption = "���ӕr�@ʾ���_ʼ���֡���Ԓ��"
chkPromptSave.Caption = "��ʾ�������"
chkAutoSave.Caption = "�Ԅӱ������"
frmEngine.Caption = "��X"
lblMoveDelay.Caption = "�����ӕr"
lblDelaySec.Caption = "��"
chkAutoFlip.Caption = "�Ԅӷ��D��P"
chkEngineName.Caption = "�@ʾ�������Q"
chkAlwaysPonder.Caption = "������̨˼��"
chkAllowResign.Caption = "���S����Jݔ"
chkEngineTime.Caption = "�@ʾ˼���r�g"
chkStatusBar.Caption = "ݔ������B��"
lblEnginePlay.Caption = "�¾���X��B"
lblUser.Caption = "�˙C�����Ñ�"
btnConfirm.Caption = "�_��"
btnCancel.Caption = "ȡ��"

End Sub

Private Sub txtPlayIntv_Change()

If nPlayIntv <> Str2Int(txtPlayIntv.Text) Then
    nPlayIntv = Str2Int(txtPlayIntv.Text, 1, 10)
    txtPlayIntv.Text = nPlayIntv
End If

End Sub

Private Sub txtMoveDelay_Change()

If nMoveDelay <> Str2Int(txtMoveDelay.Text) Then
    nMoveDelay = Str2Int(txtMoveDelay.Text, 0, 5)
    txtMoveDelay.Text = nMoveDelay
End If

End Sub

Private Sub btnConfirm_Click()

If Options_bLargeGui <> optLargeGui.Value Then
    SaveSetting "XQWizard", "Options", "LargeGui", IIf(optLargeGui.Value, "1", "0")
    MsgBox L("��ʾģʽ�Ѿ����ģ�������������������Ч��", _
            "�@ʾģʽ�ѽ����ģ������ӳ����������Ч��"), vbInformation
End If
Options_bSounds = (chkSounds.Value = 1)
Options_nPlayIntv = nPlayIntv
Options_bAutoPlay = (chkAutoPlay.Value = 1)
Options_nMoveDelay = nMoveDelay
Options_bAutoFlip = (chkAutoFlip.Value = 1)
Options_bEngineName = (chkEngineName.Value = 1)
Options_bAlwaysPonder = (chkAlwaysPonder.Value = 1)
Options_bAllowResign = (chkAllowResign.Value = 1)
Options_bEngineTime = (chkEngineTime.Value = 1)
Options_bStatusBar = (chkStatusBar.Value = 1)
Options_nEnginePlay = cmbEnginePlay.ListIndex
Options_szUser = txtUser.Text
Options_bPromptSave = (chkPromptSave.Value = 1)
Options_bAutoSave = (chkAutoSave.Value = 1)
Options_bShowNew = (chkShowNew.Value = 1)
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
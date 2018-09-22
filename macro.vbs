Public Function exportCode(ByVal ws As Worksheet) As String
    Dim questions(60, 5) As String
    outputstring = "var " & Replace(ws.Name, " ", "_") & "=["
    For counter = 1 To 60
        If (ws.Cells(counter + 1, 1).Value <> "") Then
            args = 3
            If (ws.Cells(counter + 1, 6) = "") Then args = 2
            If (ws.Cells(counter + 1, 4) = "") Then args = 1
           ' MsgBox (ws.Cells(counter + 1, 2).Value)
            'MsgBox (args)
            Select Case args
            Case 1
                outputstring = outputstring & "[" & counter - 1 & ",""" & ws.Cells(counter + 1, 2).Value & """" & "],"
            Case 2
                outputstring = outputstring & "[" & counter - 1 & ",""" & ws.Cells(counter + 1, 2).Value & """,""" & ws.Cells(counter + 1, 3).Value & """," & ws.Cells(counter + 1, 4).Value - 1 & "],"
            Case 3
                outputstring = outputstring & "[" & counter - 1 & ",""" & ws.Cells(counter + 1, 2).Value & """,""" & ws.Cells(counter + 1, 3).Value & """," & ws.Cells(counter + 1, 4).Value - 1 & ",""" & ws.Cells(counter + 1, 5).Value & """," & ws.Cells(counter + 1, 6).Value - 1 & "],"
            End Select
        End If
    Next counter
    outputstring = outputstring & "];"
    exportCode = outputstring
End Function
Public Sub exportAll()
    outputcode = ""
    processList = ""
    processNameList = ""
    For Each ws In ActiveWorkbook.Worksheets
        outputcode = outputcode & exportCode(ws)
        processList = processList & "," & Replace(ws.Name, " ", "_")
        processNameList = processNameList & ",'" & Replace(ws.Name, " ", "_") & "'"
    Next
    outputcode = outputcode & vbCrLf
    processList = Right(processList, Len(processList) - 1)
    processNameList = Right(processNameList, Len(processNameList) - 1)
    outputcode = outputcode & "var processes=[" & processList & "];"
    outputcode = outputcode & "var processnames=[" & processNameList & "];"
    Dim jsFile As String
    jsFile = "C:\Users\Martin Rothe\Desktop\ProcessGuide\Files\excel.js"
    Open jsFile For Output As #1
    Print #1, outputcode
    Close #1
    exportWindow.Label1.Visible = True
    Application.Wait (Now + #12:00:04 AM#)
    exportWindow.Label1.Visible = False
End Sub


Private Sub Workbook_Open()
exportWindow.Show (modeless)
End Sub

Sub ConvertTextBoxesToText()
    Dim shp As Shape
    Dim rng As Range
    Dim textToInsert As String
    
   'ȷ�������ݱ�ѡ��
    If Selection.Type <> wdSelectionShape Then
        MsgBox "����ѡ���ı���"
        Exit Sub
    End If
    
   '����ѡ�е��ı���
    For Each shp In Selection.ShapeRange
        If shp.Type = msoTextBox Then
           '��ȡ�ı����е��ı�
            textToInsert = shp.TextFrame.TextRange.Text
           'ɾ���ı���
            shp.Delete
           '���ı����뵽�ĵ���
            If rng Is Nothing Then
                Set rng = ActiveDocument.Range(Selection.Start, Selection.Start)
            Else
                Set rng = ActiveDocument.Range(rng.End, rng.End)
            End If
            rng.InsertAfter textToInsert
            rng.Collapse wdCollapseEnd
        End If
    Next shp
End Sub
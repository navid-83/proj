<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MaxiTester
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Transmitted = New System.Windows.Forms.TextBox
        Me.Received = New System.Windows.Forms.TextBox
        Me.SendButton = New System.Windows.Forms.Button
        Me.TransmittedLabel = New System.Windows.Forms.Label
        Me.ReceivedLabel = New System.Windows.Forms.Label
        Me.BaudRateBox = New System.Windows.Forms.ComboBox
        Me.BaudRateLabel = New System.Windows.Forms.Label
        Me.COMPortsBox = New System.Windows.Forms.ComboBox
        Me.ComPortLabel = New System.Windows.Forms.Label
        Me.ClearButton = New System.Windows.Forms.Button
        Me.BreakButton = New System.Windows.Forms.Button
        Me.RTSLamp = New System.Windows.Forms.Button
        Me.DTRLamp = New System.Windows.Forms.Button
        Me.DSRLamp = New System.Windows.Forms.Button
        Me.CTSLamp = New System.Windows.Forms.Button
        Me.ParityBox = New System.Windows.Forms.ComboBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.FlowControlBox = New System.Windows.Forms.ComboBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.BitsBox = New System.Windows.Forms.ComboBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.Button1 = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Transmitted
        '
        Me.Transmitted.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Transmitted.Location = New System.Drawing.Point(12, 424)
        Me.Transmitted.Multiline = True
        Me.Transmitted.Name = "Transmitted"
        Me.Transmitted.Size = New System.Drawing.Size(914, 87)
        Me.Transmitted.TabIndex = 0
        '
        'Received
        '
        Me.Received.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Received.Location = New System.Drawing.Point(12, 68)
        Me.Received.Multiline = True
        Me.Received.Name = "Received"
        Me.Received.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.Received.Size = New System.Drawing.Size(914, 310)
        Me.Received.TabIndex = 1
        '
        'SendButton
        '
        Me.SendButton.Location = New System.Drawing.Point(378, 517)
        Me.SendButton.Name = "SendButton"
        Me.SendButton.Size = New System.Drawing.Size(75, 23)
        Me.SendButton.TabIndex = 2
        Me.SendButton.Text = "Send"
        Me.SendButton.UseVisualStyleBackColor = True
        '
        'TransmittedLabel
        '
        Me.TransmittedLabel.AutoSize = True
        Me.TransmittedLabel.Location = New System.Drawing.Point(21, 408)
        Me.TransmittedLabel.Name = "TransmittedLabel"
        Me.TransmittedLabel.Size = New System.Drawing.Size(62, 13)
        Me.TransmittedLabel.TabIndex = 3
        Me.TransmittedLabel.Text = "Transmitted"
        '
        'ReceivedLabel
        '
        Me.ReceivedLabel.AutoSize = True
        Me.ReceivedLabel.Location = New System.Drawing.Point(21, 52)
        Me.ReceivedLabel.Name = "ReceivedLabel"
        Me.ReceivedLabel.Size = New System.Drawing.Size(53, 13)
        Me.ReceivedLabel.TabIndex = 4
        Me.ReceivedLabel.Text = "Received"
        '
        'BaudRateBox
        '
        Me.BaudRateBox.FormattingEnabled = True
        Me.BaudRateBox.Location = New System.Drawing.Point(255, 17)
        Me.BaudRateBox.Name = "BaudRateBox"
        Me.BaudRateBox.Size = New System.Drawing.Size(83, 21)
        Me.BaudRateBox.TabIndex = 5
        '
        'BaudRateLabel
        '
        Me.BaudRateLabel.AutoSize = True
        Me.BaudRateLabel.Location = New System.Drawing.Point(174, 20)
        Me.BaudRateLabel.Name = "BaudRateLabel"
        Me.BaudRateLabel.Size = New System.Drawing.Size(75, 13)
        Me.BaudRateLabel.TabIndex = 6
        Me.BaudRateLabel.Text = "Bit Rate (bit/s)"
        '
        'COMPortsBox
        '
        Me.COMPortsBox.FormattingEnabled = True
        Me.COMPortsBox.Location = New System.Drawing.Point(80, 17)
        Me.COMPortsBox.Name = "COMPortsBox"
        Me.COMPortsBox.Size = New System.Drawing.Size(73, 21)
        Me.COMPortsBox.TabIndex = 7
        '
        'ComPortLabel
        '
        Me.ComPortLabel.AutoSize = True
        Me.ComPortLabel.Location = New System.Drawing.Point(21, 20)
        Me.ComPortLabel.Name = "ComPortLabel"
        Me.ComPortLabel.Size = New System.Drawing.Size(53, 13)
        Me.ComPortLabel.TabIndex = 8
        Me.ComPortLabel.Text = "COM Port"
        '
        'ClearButton
        '
        Me.ClearButton.Location = New System.Drawing.Point(378, 384)
        Me.ClearButton.Name = "ClearButton"
        Me.ClearButton.Size = New System.Drawing.Size(75, 23)
        Me.ClearButton.TabIndex = 9
        Me.ClearButton.Text = "Clear"
        Me.ClearButton.UseVisualStyleBackColor = True
        '
        'BreakButton
        '
        Me.BreakButton.Location = New System.Drawing.Point(490, 517)
        Me.BreakButton.Name = "BreakButton"
        Me.BreakButton.Size = New System.Drawing.Size(75, 23)
        Me.BreakButton.TabIndex = 10
        Me.BreakButton.Text = "Break"
        Me.BreakButton.UseVisualStyleBackColor = True
        '
        'RTSLamp
        '
        Me.RTSLamp.Location = New System.Drawing.Point(871, 517)
        Me.RTSLamp.Name = "RTSLamp"
        Me.RTSLamp.Size = New System.Drawing.Size(39, 23)
        Me.RTSLamp.TabIndex = 11
        Me.RTSLamp.Text = "RTS"
        Me.RTSLamp.UseVisualStyleBackColor = True
        '
        'DTRLamp
        '
        Me.DTRLamp.Location = New System.Drawing.Point(826, 517)
        Me.DTRLamp.Name = "DTRLamp"
        Me.DTRLamp.Size = New System.Drawing.Size(39, 23)
        Me.DTRLamp.TabIndex = 12
        Me.DTRLamp.Text = "DTR"
        Me.DTRLamp.UseVisualStyleBackColor = True
        '
        'DSRLamp
        '
        Me.DSRLamp.Location = New System.Drawing.Point(826, 383)
        Me.DSRLamp.Name = "DSRLamp"
        Me.DSRLamp.Size = New System.Drawing.Size(39, 23)
        Me.DSRLamp.TabIndex = 13
        Me.DSRLamp.Text = "DSR"
        Me.DSRLamp.UseVisualStyleBackColor = True
        '
        'CTSLamp
        '
        Me.CTSLamp.Location = New System.Drawing.Point(871, 383)
        Me.CTSLamp.Name = "CTSLamp"
        Me.CTSLamp.Size = New System.Drawing.Size(39, 23)
        Me.CTSLamp.TabIndex = 14
        Me.CTSLamp.Text = "CTS"
        Me.CTSLamp.UseVisualStyleBackColor = True
        '
        'ParityBox
        '
        Me.ParityBox.FormattingEnabled = True
        Me.ParityBox.Location = New System.Drawing.Point(537, 17)
        Me.ParityBox.Name = "ParityBox"
        Me.ParityBox.Size = New System.Drawing.Size(65, 21)
        Me.ParityBox.TabIndex = 15
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(498, 20)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(33, 13)
        Me.Label1.TabIndex = 16
        Me.Label1.Text = "Parity"
        '
        'FlowControlBox
        '
        Me.FlowControlBox.FormattingEnabled = True
        Me.FlowControlBox.Location = New System.Drawing.Point(757, 17)
        Me.FlowControlBox.Name = "FlowControlBox"
        Me.FlowControlBox.Size = New System.Drawing.Size(153, 21)
        Me.FlowControlBox.TabIndex = 17
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(638, 20)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(113, 13)
        Me.Label2.TabIndex = 18
        Me.Label2.Text = "Software Flow Control "
        '
        'BitsBox
        '
        Me.BitsBox.FormattingEnabled = True
        Me.BitsBox.Location = New System.Drawing.Point(418, 17)
        Me.BitsBox.Name = "BitsBox"
        Me.BitsBox.Size = New System.Drawing.Size(50, 21)
        Me.BitsBox.TabIndex = 19
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(362, 20)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(50, 13)
        Me.Label3.TabIndex = 20
        Me.Label3.Text = "Data Bits"
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(490, 384)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 21
        Me.Button1.Text = "Save"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'MaxiTester
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(938, 552)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.BitsBox)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.FlowControlBox)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.ParityBox)
        Me.Controls.Add(Me.CTSLamp)
        Me.Controls.Add(Me.DSRLamp)
        Me.Controls.Add(Me.DTRLamp)
        Me.Controls.Add(Me.RTSLamp)
        Me.Controls.Add(Me.BreakButton)
        Me.Controls.Add(Me.ClearButton)
        Me.Controls.Add(Me.ComPortLabel)
        Me.Controls.Add(Me.COMPortsBox)
        Me.Controls.Add(Me.BaudRateLabel)
        Me.Controls.Add(Me.BaudRateBox)
        Me.Controls.Add(Me.ReceivedLabel)
        Me.Controls.Add(Me.TransmittedLabel)
        Me.Controls.Add(Me.SendButton)
        Me.Controls.Add(Me.Received)
        Me.Controls.Add(Me.Transmitted)
        Me.Name = "MaxiTester"
        Me.Text = "Innovatic Max-i Tester"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Transmitted As System.Windows.Forms.TextBox
    Friend WithEvents Received As System.Windows.Forms.TextBox
    Friend WithEvents SendButton As System.Windows.Forms.Button
    Friend WithEvents TransmittedLabel As System.Windows.Forms.Label
    Friend WithEvents ReceivedLabel As System.Windows.Forms.Label
    Friend WithEvents BaudRateBox As System.Windows.Forms.ComboBox
    Friend WithEvents BaudRateLabel As System.Windows.Forms.Label
    Friend WithEvents COMPortsBox As System.Windows.Forms.ComboBox
    Friend WithEvents ComPortLabel As System.Windows.Forms.Label
    Friend WithEvents ClearButton As System.Windows.Forms.Button
    Friend WithEvents BreakButton As System.Windows.Forms.Button
    Friend WithEvents RTSLamp As System.Windows.Forms.Button
    Friend WithEvents DTRLamp As System.Windows.Forms.Button
    Friend WithEvents DSRLamp As System.Windows.Forms.Button
    Friend WithEvents CTSLamp As System.Windows.Forms.Button
    Friend WithEvents ParityBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents FlowControlBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label2 As System.Windows.Forms.Label

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

    End Sub
    Friend WithEvents BitsBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Button1 As System.Windows.Forms.Button
End Class

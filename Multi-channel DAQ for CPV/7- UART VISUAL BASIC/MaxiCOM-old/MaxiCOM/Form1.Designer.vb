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
        Me.Temperature = New System.Windows.Forms.TextBox()
        Me.TempLabel = New System.Windows.Forms.Label()
        Me.LightLabel = New System.Windows.Forms.Label()
        Me.Light = New System.Windows.Forms.TextBox()
        Me.Volt = New System.Windows.Forms.TextBox()
        Me.Current = New System.Windows.Forms.TextBox()
        Me.VoltLabel = New System.Windows.Forms.Label()
        Me.CurrentLabel = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'Temperature
        '
        Me.Temperature.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Temperature.Location = New System.Drawing.Point(33, 50)
        Me.Temperature.Name = "Temperature"
        Me.Temperature.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.Temperature.Size = New System.Drawing.Size(141, 22)
        Me.Temperature.TabIndex = 1
        '
        'TempLabel
        '
        Me.TempLabel.AutoSize = True
        Me.TempLabel.Location = New System.Drawing.Point(30, 34)
        Me.TempLabel.Name = "TempLabel"
        Me.TempLabel.Size = New System.Drawing.Size(67, 13)
        Me.TempLabel.TabIndex = 4
        Me.TempLabel.Text = "Temperature"
        '
        'LightLabel
        '
        Me.LightLabel.AutoSize = True
        Me.LightLabel.Location = New System.Drawing.Point(30, 87)
        Me.LightLabel.Name = "LightLabel"
        Me.LightLabel.Size = New System.Drawing.Size(30, 13)
        Me.LightLabel.TabIndex = 5
        Me.LightLabel.Text = "Light"
        '
        'Light
        '
        Me.Light.Location = New System.Drawing.Point(33, 103)
        Me.Light.Name = "Light"
        Me.Light.Size = New System.Drawing.Size(141, 20)
        Me.Light.TabIndex = 6
        '
        'Volt
        '
        Me.Volt.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Volt.Location = New System.Drawing.Point(268, 50)
        Me.Volt.Name = "Volt"
        Me.Volt.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.Volt.Size = New System.Drawing.Size(141, 22)
        Me.Volt.TabIndex = 7
        '
        'Current
        '
        Me.Current.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Current.Location = New System.Drawing.Point(268, 101)
        Me.Current.Name = "Current"
        Me.Current.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.Current.Size = New System.Drawing.Size(141, 22)
        Me.Current.TabIndex = 8
        '
        'VoltLabel
        '
        Me.VoltLabel.AutoSize = True
        Me.VoltLabel.Location = New System.Drawing.Point(265, 34)
        Me.VoltLabel.Name = "VoltLabel"
        Me.VoltLabel.Size = New System.Drawing.Size(30, 13)
        Me.VoltLabel.TabIndex = 9
        Me.VoltLabel.Text = "Volts"
        '
        'CurrentLabel
        '
        Me.CurrentLabel.AutoSize = True
        Me.CurrentLabel.Location = New System.Drawing.Point(265, 85)
        Me.CurrentLabel.Name = "CurrentLabel"
        Me.CurrentLabel.Size = New System.Drawing.Size(41, 13)
        Me.CurrentLabel.TabIndex = 10
        Me.CurrentLabel.Text = "Current"
        '
        'MaxiTester
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(507, 248)
        Me.Controls.Add(Me.CurrentLabel)
        Me.Controls.Add(Me.VoltLabel)
        Me.Controls.Add(Me.Current)
        Me.Controls.Add(Me.Volt)
        Me.Controls.Add(Me.Light)
        Me.Controls.Add(Me.LightLabel)
        Me.Controls.Add(Me.TempLabel)
        Me.Controls.Add(Me.Temperature)
        Me.Name = "MaxiTester"
        Me.Text = "Innovatic Max-i Tester"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Temperature As System.Windows.Forms.TextBox
    Friend WithEvents TempLabel As System.Windows.Forms.Label

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

    End Sub
    Friend WithEvents LightLabel As System.Windows.Forms.Label
    Friend WithEvents Light As System.Windows.Forms.TextBox
    Friend WithEvents Volt As System.Windows.Forms.TextBox
    Friend WithEvents Current As System.Windows.Forms.TextBox
    Friend WithEvents VoltLabel As System.Windows.Forms.Label
    Friend WithEvents CurrentLabel As System.Windows.Forms.Label
End Class

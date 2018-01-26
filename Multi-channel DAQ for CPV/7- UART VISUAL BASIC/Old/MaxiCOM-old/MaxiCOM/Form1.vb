' 

Imports System
Imports System.IO.Ports
Imports System.Threading
Imports System.Threading.Thread


Public Class MaxiTester

    Dim SpaceCount As Byte = 0
    Dim LookUpTable As String = "0123456789ABCDEF"
    Dim stringtoparse As String ' Text buffer. Must be global to be accessible from more threads.
    Dim RXCnt As Integer      ' Length of text buffer. Must be global too.

    ' Make a new System.IO.Ports.SerialPort instance, which is able to fire events.
    Dim WithEvents COMPort As New SerialPort

    Private Sub Receiver(ByVal sender As Object, ByVal e As SerialDataReceivedEventArgs) Handles COMPort.DataReceived

        Do
            '----- Start of communication protocol handling -----------------------------------------------------------
            ' The code between the two lines does the communication protocol. In this case, it simply emties the
            '   receive buffer and converts it to text, but for all practical applications, you must replace this part
            '     with a code, which can collect one entire telegram by searching for the telegram
            '       delimiter/termination. In case of a simple ASCII protocol, you may just use ReadLine and receive
            '         in a global string instead of a byte array.
            ' Because this routine runs on a thread pool thread, it does not block the UI, so if you have any data
            '   convertion, encryption, expansion, error detection, error correction etc. to do, do it here.
            'stringtoparse = COMPort.ReadLine()
            'stringtoparse = COMPort.ReadExisting()
            '----- End of communication protocol handling -------------------------------------------------------------
            Me.Invoke(New MethodInvoker(AddressOf Display)) ' Start "Display" on the UI thread
        Loop Until (COMPort.BytesToRead = 0)  ' Don't return if more bytes have become available in the meantime
    End Sub

    ' Text display routine, which appends the received string to any text in the Received TextBox.

    Private Sub Display()
        Temperature.Text = New String(stringtoparse)
        Light.Text = New String(stringtoparse)
        Volt.Text = New String(stringtoparse)
        Current.Text = New String(stringtoparse)
    End Sub

    
    ' This subroutine is activated when the form is loaded. It does all the basic initializations.
    ' Note! Baud Rates above 115.2 KBaud requires a special UART like e.g. 16C650, 16C750, 16C850 or 16C950 and
    '   a special driver.
    ' RTS/CTS hardware flow control is necessary for Max-i communication. Note that the standard UART 16C550
    '   has no hardware flow control - except for UART's from Texas Instruments.
    ' The minimum FIFO size is calculated on the basis of a 1.4 mS response time, which is the absolute minimum
    '   for Windows applications.

    Private Sub MaxiTesterLoad(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        COMPort.PortName = "COM15"
        COMPort.BaudRate = "19200"
        COMPort.Open()
    End Sub


    ' This subroutine is used to close the COM port. Because the program uses Invoke instead of BeginInvoke, this
    '   routine is usually called on a separate (new) thread to prevent a close-down deadlock.

    Private Sub ClosePort()
        If COMPort.IsOpen Then COMPort.Close()
    End Sub

    ' This subroutine is activated when the form is closed. It closes the COM port. Without such a close command,
    '   the garbage collector may close the COM port while it is still in use!

    Private Sub MaxiTesterClosing(ByVal sender As Object, ByVal e As ComponentModel.CancelEventArgs) Handles MyBase.Closing
        If MessageBox.Show("Do you really want to close the window", "", MessageBoxButtons.YesNo) = Windows.Forms.DialogResult.No Then
            e.Cancel = True
        Else
            ' Close COM port on a new thread when the form is terminated with [X]
            Dim t As New Thread(AddressOf ClosePort)
            t.Start()
        End If
    End Sub

    ' This subroutine saves the content of the Received TextBox

    Private Sub SaveText(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim SaveFileDialog1 As New SaveFileDialog()
        SaveFileDialog1.Filter = "Text Files (*.txt)|*.txt"
        SaveFileDialog1.Title = "Save Received As"
        If SaveFileDialog1.ShowDialog() = System.Windows.Forms.DialogResult.OK _
            And SaveFileDialog1.FileName.Length > 0 Then
            My.Computer.FileSystem.WriteAllText(SaveFileDialog1.FileName, Temperature.Text, False) ' Overwrite file
        End If
    End Sub

End Class
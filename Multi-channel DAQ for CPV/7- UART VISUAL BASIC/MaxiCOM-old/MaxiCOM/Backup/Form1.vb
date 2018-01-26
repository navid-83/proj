' This program is able to communicate with the Max-i chip and most other serial devices by means of a COM port. The
'   program has been designed for very high-speed operation with maximum efficiency as Max-i goes up to 1.843 Mbit/s
'     and is able to transfer up to 10,000 telegrams per second where several hundreds may be passed to the PC.
'       Because of this, not everything is made quite by-the-book. For example, the program uses global buffers
'         (usually not recommended for object oriented programming) and Invoke instead of BeginInvoke.
' The input to the transmitter field may be any mix between hexadecimal numbers with an even number of digits and
'   ASCII characters embedded in quotation marks like e.g. "UU" 77 """A" 66 55FF => 55 55 77 22 41 66 55 FF.
'     Note that ASCII " is specified as "" as in Visual Basic. In case of hexadecimal numbers with 4 or more
'       digits, the number is transmitted with the big-endian model, meaning that the most significant part is
'         transmitted first.
' To make it easier to separate transmissions and receptions, the program appends a "TX" to the received textbox each
'   time you transmit anything.
' The maximum length of each telegram is 2048 bytes. If longer telegrams are needed, the size of the two arrays
'   RXArray and TXArray must be increased.
'
' Innovatic, Carsten Kanstrup. February 19th 2010

Imports System
Imports System.IO.Ports
Imports System.Threading
Imports System.Threading.Thread
' Imports the System, System.IO.Ports and System.Threading.Thread namespaces so that e.g.
'   System.IO.Ports.SerialPort may just be written as SerialPort, and System.EventArgs may just be
'     written as EventArgs.

Public Class MaxiTester

    Dim SpaceCount As Byte = 0
    Dim LookUpTable As String = "0123456789ABCDEF"
    Dim RXArray(2047) As Char ' Text buffer. Must be global to be accessible from more threads.
    Dim RXCnt As Integer      ' Length of text buffer. Must be global too.

    ' Make a new System.IO.Ports.SerialPort instance, which is able to fire events.
    Dim WithEvents COMPort As New SerialPort

    Private Sub Receiver(ByVal sender As Object, ByVal e As SerialDataReceivedEventArgs) Handles COMPort.DataReceived
        Dim RXByte As Byte
        Do
            '----- Start of communication protocol handling -----------------------------------------------------------
            ' The code between the two lines does the communication protocol. In this case, it simply emties the
            '   receive buffer and converts it to text, but for all practical applications, you must replace this part
            '     with a code, which can collect one entire telegram by searching for the telegram
            '       delimiter/termination. In case of a simple ASCII protocol, you may just use ReadLine and receive
            '         in a global string instead of a byte array.
            ' Because this routine runs on a thread pool thread, it does not block the UI, so if you have any data
            '   convertion, encryption, expansion, error detection, error correction etc. to do, do it here.
            RXCnt = 0
            Do
                RXByte = COMPort.ReadByte
                RXArray(RXCnt) = LookUpTable(RXByte >> 4) ' Convert each byte to two hexadecimal characters
                RXCnt = RXCnt + 1
                RXArray(RXCnt) = LookUpTable(RXByte And 15)
                RXCnt = RXCnt + 1
                RXArray(RXCnt) = " "
                RXCnt = RXCnt + 1
                SpaceCount = (SpaceCount + 1) And 31      ' Insert spaces and CRLF for better readability
                If SpaceCount = 0 Then                    ' Insert CRLF after 32 numbers
                    RXArray(RXCnt) = Chr(13) ' CR
                    RXCnt = RXCnt + 1
                    RXArray(RXCnt) = Chr(10) ' LF
                    RXCnt = RXCnt + 1
                Else
                    If (SpaceCount And 3) = 0 Then        ' Insert two extra spaces for each 4 numbers
                        RXArray(RXCnt) = " "
                        RXCnt = RXCnt + 1
                        RXArray(RXCnt) = " "
                        RXCnt = RXCnt + 1
                    End If
                End If
            Loop Until (COMPort.BytesToRead = 0)
            '----- End of communication protocol handling -------------------------------------------------------------
            Me.Invoke(New MethodInvoker(AddressOf Display)) ' Start "Display" on the UI thread
        Loop Until (COMPort.BytesToRead = 0)  ' Don't return if more bytes have become available in the meantime
    End Sub

    ' Text display routine, which appends the received string to any text in the Received TextBox.

    Private Sub Display()
        Received.AppendText(New String(RXArray, 0, RXCnt))
    End Sub

    ' Transmitter subroutine.

    Private Sub Transmitter(ByVal sender As Object, ByVal e As EventArgs) Handles SendButton.Click
        Received.AppendText("TX" & vbCrLf)        ' Switch to a new line after every transmission
        SpaceCount = 0
        Dim TextString As String
        Dim TXArray(2047) As Byte
        Dim I As Integer
        Dim J As Integer = 0
        Dim Ascii As Boolean = False
        Dim Quote As Boolean = False
        Dim Temp As Boolean
        Dim Second As Boolean = False
        Dim TXByte As Byte = 0
        Dim CharByte As Byte
        If COMPort.IsOpen Then
            TextString = Transmitted.Text
            For I = 0 To TextString.Length - 1
                CharByte = Asc(TextString.Chars(I))
                If CharByte = 34 Then ' If " Then
                    Temp = Ascii
                    Ascii = Ascii Or Quote
                    Quote = Not (Temp And Quote)
                Else
                    Ascii = Ascii Xor Quote
                    Quote = False
                End If
                If Not Quote Then
                    If Ascii Then
                        TXArray(J) = CharByte
                        J = J + 1
                    Else
                        If (CharByte <> 32) And (CharByte <> 10) And (CharByte <> 13) Then ' Skip spaces, LF and CR
                            CharByte = (CharByte - 48) And 31 ' And 31 makes it case insensitive
                            If CharByte > 16 Then
                                CharByte = CharByte - 7
                            End If
                            If Second Then
                                TXArray(J) = TXByte + CharByte
                                Second = False
                                J = J + 1
                            Else
                                TXByte = CharByte << 4
                                Second = True
                            End If
                        End If
                    End If
                End If
            Next
            Try
                COMPort.Write(TXArray, 0, J)
            Catch ex As Exception
                MsgBox(ex.Message & "  Check CTS signal or set Flow Control to None.")
            End Try
        Else
            MsgBox("COM port is closed. Please select a COM port")
        End If
    End Sub

    ' This subroutine handles a change of COM ports.

    Private Sub PortSelection(ByVal sender As Object, ByVal e As EventArgs) Handles COMPortsBox.SelectedIndexChanged
        RTSLamp.BackColor = Color.Gray
        DTRLamp.BackColor = Color.Gray
        If COMPort.IsOpen Then
            COMPort.RtsEnable = False
            COMPort.DtrEnable = False
            ClosePort()
            ' NOTE. Because of the use of Invoke, the port should normally be closed from a different thread, see
            '   MaxiTesterClosing, but to ensure that the following delay works, this is not done in this case.
            ' Empty the message queue before the UI thread goes to sleep to update the modem lamps and the ComboBox.
            Application.DoEvents()
            Sleep(200)                      ' Wait 0.2 second for port to close as this does not happen immediately.
        End If
        COMPort.PortName = COMPortsBox.Text
        COMPort.BaudRate = 19200            ' Default for Max-i: 19200 bit/s, 8 data bits, no parity, 1 stop bit
        COMPort.WriteTimeout = 2000         ' Max time to wait for CTS = 2 sec.
        ' COMPort.ReadBufferSize = 16384      Necessary buffer size for 16C950 UART at 921.6 kbit/s
        Try
            COMPort.Open()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        BaudRateBox.Text = COMPort.BaudRate.ToString
        BitsBox.Text = COMPort.DataBits.ToString
        ParityBox.Text = COMPort.Parity.ToString
        FlowControlBox.Text = COMPort.Handshake.ToString
        If COMPort.IsOpen Then
            COMPort.RtsEnable = True
            RTSLamp.BackColor = Color.LightGreen
            COMPort.DtrEnable = True
            DTRLamp.BackColor = Color.LightGreen
        End If
    End Sub

    ' This subroutine is activated when the form is loaded. It does all the basic initializations.
    ' Note! Baud Rates above 115.2 KBaud requires a special UART like e.g. 16C650, 16C750, 16C850 or 16C950 and
    '   a special driver.
    ' RTS/CTS hardware flow control is necessary for Max-i communication. Note that the standard UART 16C550
    '   has no hardware flow control - except for UART's from Texas Instruments.
    ' The minimum FIFO size is calculated on the basis of a 1.4 mS response time, which is the absolute minimum
    '   for Windows applications.

    Private Sub MaxiTesterLoad(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        For Each COMString As String In My.Computer.Ports.SerialPortNames ' Load all available COM ports.
            COMPortsBox.Items.Add(COMString)
        Next
        COMPortsBox.Sorted = True
        BaudRateBox.Items.Add("110")
        BaudRateBox.Items.Add("300")
        BaudRateBox.Items.Add("600")
        BaudRateBox.Items.Add("1200")
        BaudRateBox.Items.Add("1800")
        BaudRateBox.Items.Add("2400")
        BaudRateBox.Items.Add("4800")
        BaudRateBox.Items.Add("7200")
        BaudRateBox.Items.Add("9600")
        BaudRateBox.Items.Add("14400")
        BaudRateBox.Items.Add("19200")      ' Min. FIFO size 3 Bytes (8030 or 8530)
        BaudRateBox.Items.Add("38400")
        BaudRateBox.Items.Add("57600")      ' Min. FIFO size 8 bytes
        BaudRateBox.Items.Add("115200")     ' Min. FIFO size 16 bytes (16C550)
        BaudRateBox.Items.Add("230400")     ' Min. FIFO size 32 bytes (16C650)
        BaudRateBox.Items.Add("460800")     ' Min. FIFO size 64 bytes (16C750)
        BaudRateBox.Items.Add("921600")     ' Min. FIFO size 128 bytes (16C850 or 16C950)
        BitsBox.Items.Add("5")
        BitsBox.Items.Add("6")
        BitsBox.Items.Add("7")
        BitsBox.Items.Add("8")
        ParityBox.Items.Add("None")
        ParityBox.Items.Add("Odd")
        ParityBox.Items.Add("Even")
        ParityBox.Items.Add("Mark")         ' Leaves the parity bit set to 1
        ParityBox.Items.Add("Space")        ' Leaves the parity bit set to 0
        FlowControlBox.Items.Add("None")
        FlowControlBox.Items.Add("RequestToSend")
        FlowControlBox.Items.Add("RequestToSendXOnXOff")
        FlowControlBox.Items.Add("XOnXOff")
        RTSLamp.BackColor = Color.Gray
        DTRLamp.BackColor = Color.Gray
        CTSLamp.BackColor = Color.Gray
        DSRLamp.BackColor = Color.Gray
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

    ' This subroutine clears the Received TextBox for received bytes.

    Private Sub ClearReceivedText(ByVal sender As Object, ByVal e As EventArgs) Handles ClearButton.Click
        Received.Text = ""
        SpaceCount = 0
    End Sub

    ' This subroutines inserts a Break condition.

    Private Sub SendBreak(ByVal sender As Object, ByVal e As EventArgs) Handles BreakButton.Click
        If COMPort.IsOpen Then
            COMPort.BreakState = True
            Sleep((11000 / COMPort.BaudRate) + 10)
            ' Min. 11 bit delay (startbit, 8 data bits, parity bit, stopbit). 10 mS have been added to ensure that
            '   the delay is always active. If the delay time is less than the task switching time, the two BreakState
            '     instructions may be activated immediately after each other ! On a multiprocessor system, you must
            '       add 15 mS instead.
            COMPort.BreakState = False
        Else
            MsgBox("No COM Port Selected")
        End If
    End Sub

    ' This subroutine handles a change in Baud Rate.

    Private Sub BaudRateSelection(ByVal sender As Object, ByVal e As EventArgs) Handles BaudRateBox.SelectedIndexChanged
        COMPort.BaudRate = CInt(BaudRateBox.Text)
    End Sub

    ' This subroutine handles a change in number of data bits

    Private Sub DataBitsSelection(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BitsBox.SelectedIndexChanged
        COMPort.DataBits = CInt(BitsBox.Text)
    End Sub

    ' This subroutine handles a change in the parity.

    Private Sub ParitySelection(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ParityBox.SelectedIndexChanged
        COMPort.Parity = CType([Enum].Parse(GetType(Parity), ParityBox.Text), Parity)
    End Sub

    ' This subroutine handles a change in the flow control (handshake).

    Private Sub SoftwareFlowControlSelection(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FlowControlBox.SelectedIndexChanged
        COMPort.Handshake = CType([Enum].Parse(GetType(Handshake), FlowControlBox.Text), Handshake)
    End Sub

    ' This subroutine updates the modem control signal lamps

    Private Sub ModemLamps(ByVal sender As Object, ByVal e As SerialPinChangedEventArgs) Handles COMPort.PinChanged
        If COMPort.DsrHolding Then
            DSRLamp.BackColor = Color.LightGreen
        Else
            DSRLamp.BackColor = Color.Gray
        End If
        If COMPort.CtsHolding Then
            CTSLamp.BackColor = Color.LightGreen
        Else
            CTSLamp.BackColor = Color.Gray
        End If
    End Sub

    ' This subroutine saves the content of the Received TextBox

    Private Sub SaveText(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim SaveFileDialog1 As New SaveFileDialog()
        SaveFileDialog1.Filter = "Text Files (*.txt)|*.txt"
        SaveFileDialog1.Title = "Save Received As"
        If SaveFileDialog1.ShowDialog() = System.Windows.Forms.DialogResult.OK _
            And SaveFileDialog1.FileName.Length > 0 Then
            My.Computer.FileSystem.WriteAllText(SaveFileDialog1.FileName, Received.Text, False) ' Overwrite file
        End If
    End Sub

End Class
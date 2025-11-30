package com.example.serialportscannerjunsun

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.ScrollView
import androidx.appcompat.app.AppCompatActivity
import java.io.File

class MainActivity : AppCompatActivity() {
    private lateinit var logTextView: TextView
    private lateinit var scanButton: Button
    private lateinit var scrollView: ScrollView
    private var readerThread: Thread? = null
    private var isReading = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        logTextView = findViewById(R.id.logTextView)
        scanButton = findViewById(R.id.scanButton)
        scrollView = findViewById(R.id.scrollView)

        scanButton.setOnClickListener {
            if (!isReading) {
                startScan()
            } else {
                stopScan()
            }
        }

        addLog("SerialPortScanner Junsun 8227L")
        addLog("Scanare porturi UART...")
    }

    private fun startScan() {
        isReading = true
        scanButton.text = "STOP"
        addLog("\n--- SCANARE PORTURI UART ---")

        val ports = listOf(
            "/dev/ttyS0", "/dev/ttyS1", "/dev/ttyS2", "/dev/ttyS3",
            "/dev/ttyMT0", "/dev/ttyMT1", "/dev/ttyHSL0"
        )

        val baudRates = listOf(9600, 19200, 38400, 57600, 115200)

        readerThread = Thread {
            for (port in ports) {
                if (!isReading) break

                addLog("\nTesteaza port: $port")

                for (baud in baudRates) {
                    if (!isReading) break

                    try {
                        val portFile = File(port)
                        if (!portFile.exists()) {
                            continue
                        }

                        addLog("  $port @ $baud baud...")

                        val serialPort = SerialPort(portFile, baud, 0)
                        val input = serialPort.inputStream
                        val output = serialPort.outputStream

                        val buffer = ByteArray(256)
                        val startTime = System.currentTimeMillis()

                        while (System.currentTimeMillis() - startTime < 2000) {
                            try {
                                val len = input.read(buffer)
                                if (len > 0) {
                                    val data = buffer.copyOf(len)
                                    val hexData = data.joinToString(" ") { String.format("%02X", it) }
                                    addLog("  ✓ GASIT DATE: $hexData")
                                    addLog("  >> Port ACTIV: $port @ $baud baud!")
                                    isReading = false
                                    serialPort.close()
                                    return@Thread
                                }
                            } catch (e: Exception) {
                                // timeout sau citire esuata
                            }
                        }

                        try {
                            serialPort.close()
                        } catch (e: Exception) {
                            // ignore
                        }

                    } catch (e: Exception) {
                        // port nu deschis
                    }
                }
            }

            if (isReading) {
                addLog("\n--- SCANARE FINALIZATA - Port CAN nu gasit ---")
                runOnUiThread {
                    scanButton.text = "SCAN"
                    isReading = false
                }
            }
        }

        readerThread?.start()
    }

    private fun stopScan() {
        isReading = false
        scanButton.text = "SCAN"
        addLog("\n--- SCANARE ANULATA ---")
    }

    private fun addLog(message: String) {
        runOnUiThread {
            val current = logTextView.text.toString()
            logTextView.text = current + message + "\n"
            scrollView.post {
                scrollView.fullScroll(ScrollView.FOCUS_DOWN)
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        isReading = false
    }
}

package com.example.serialportscannerjunsun

import java.io.File
import java.io.FileDescriptor
import java.io.FileInputStream
import java.io.FileOutputStream

class SerialPort(
    private val device: File,
    private val baudrate: Int,
    private val databits: Int
) {
    private var fileDescriptor: FileDescriptor? = null
    lateinit var inputStream: FileInputStream
    lateinit var outputStream: FileOutputStream

    init {
        openSerial()
    }

    private fun openSerial() {
        try {
            fileDescriptor = FileDescriptor()
            inputStream = FileInputStream(device)
            outputStream = FileOutputStream(device)

            configureBaudRate(baudrate)
        } catch (e: Exception) {
            throw RuntimeException("Error opening serial port: ${e.message}")
        }
    }

    private fun configureBaudRate(baudrate: Int) {
        // Try to set baud rate using system calls
        try {
            val cmd = "stty -F ${device.absolutePath} $baudrate"
            Runtime.getRuntime().exec(cmd).waitFor()
        } catch (e: Exception) {
            // If stty fails, continue anyway - may still work
        }
    }

    fun close() {
        try {
            inputStream.close()
            outputStream.close()
        } catch (e: Exception) {
            // ignore
        }
    }
}

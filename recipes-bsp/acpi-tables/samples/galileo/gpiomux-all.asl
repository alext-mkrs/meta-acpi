/*
 * Intel Galileo
 *
 * This muxes out native I2C, SPI and UART0 from following pins
 *
 * J1B1:
 *
 *   pin name       pin number
 *   -------------------------
 *   IO0/RX0        1
 *   IO1/TX0        2
 *
 * J2B1:
 *
 *   pin name       pin number
 *   -------------------------
 *   IO10/SS        3
 *   IO11/MOSI      4
 *   IO12/MISO      5
 *   IO13/SCK       6
 *   SDA            9
 *   SCL            10
 *
 * Copyright (C) 2016, Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
DefinitionBlock ("gpiomux.aml", "SSDT", 5, "", "GPIOMUX", 1)
{
    #define MUX_SPI
    #define MUX_I2C
    #define MUX_UART0

    #include "gpiomux-base.asl"
}

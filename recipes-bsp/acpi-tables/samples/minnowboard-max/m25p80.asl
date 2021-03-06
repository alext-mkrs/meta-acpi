/*
 * Minnowboard MAX
 *
 * http://wiki.minnowboard.org/MinnowBoard_MAX
 *
 * This adds M25P80 (AT26DF, M25P, W25X) compatible serial flash to the SPI
 * host controller available on Minnowboard MAX low speed connector (JP1)
 * pins:
 *
 *   pin name           pin number
 *   -----------------------------
 *   GPIO_SPI_CS        5
 *   GPIO_SPI_MISO      7
 *   GPIO_SPI_MOSI      9
 *   GPIO_SPI_CLK       11
 *
 * In Linux you need to set CONFIG_MTD_M25P80=y (or m) to be able to use
 * this device.
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
DefinitionBlock ("m25p80.aml", "SSDT", 5, "", "M25P80", 1)
{
    External (_SB_.SPI1, DeviceObj)

    Scope (\_SB.SPI1)
    {
        Device (FLS0)
        {
            Name (_HID, "PRP0001")
            Name (_DDN, "M25P80 compatible serial flash")
            Name (_CRS, ResourceTemplate () {
                SpiSerialBus (
                    1,                      // Chip select
                    PolarityLow,            // Chip select is active low
                    FourWireMode,           // Full duplex
                    8,                      // Bits per word is 8 (byte)
                    ControllerInitiated,    // Don't care
                    10000000,               // 10 MHz
                    ClockPolarityLow,       // SPI mode 0
                    ClockPhaseFirst,        // SPI mode 0
                    "\\_SB.SPI1",           // SPI host controller
                    0                       // Must be 0
                )
            })

            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {"compatible", "jedec,spi-nor"},
                }
            })
        }
    }
}

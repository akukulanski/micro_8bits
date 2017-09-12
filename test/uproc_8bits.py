
from random import randint
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge, FallingEdge, Edge
from cocotb.result import TestFailure, TestError
from cocotb.binary import BinaryValue

from math import pi, sin

@cocotb.coroutine
def nsTimer (t):
    yield Timer(t,units='ns')


class MEMORY:
    def __init__ (self, clk, addr, data, we):
        self.clk = clk
        self.addr = addr
        self.data = data
        self.we = we

        self.memory = [0 for i in range(256)]

    def initMemory(self, stream):
        self.memory = [0 for i in range(len(stream))]
        self.memory[i] = stream[i] for i in range(len(stream))

    def clearMemory(self):
        self.memory = [0 for i in range(len(stream))]

    @cocotb.coroutine
    def run(self):
        highZ = BinaryValue()
        highZ.binstr = "zzzzzzzz"
        while True:
            if(self.we.value.integer == 1):
                self.data <= highZ
                yield [ nsTimer(9.2) , FallingEdge(self.we) ]
                yield Timer(1, units='ps')
                if(self.we.value.integer == 1):
                    self.memory[self.addr.value.integer] = self.data.value.integer
            else:
                yield [ nsTimer(9.2) , RisingEdge(self.we) ]
                yield Timer(1, units='ps')
                if(self.we.value.integer == 0):
                    self.data.value.integer <= self.memory[self.addr.value.integer]


@cocotb.coroutine
def Start(dut):
    dut.start <= 1
    yield RisingEdge(dut.clk)
    dut.start <= 0
    yield RisingEdge(dut.clk)

@cocotb.coroutine
def AsyncReset (rst):
    rst <= 1
    yield nsTimer(23.4)
    rst <= 0

@cocotb.coroutine
def SyncReset (clk, rst):
    rst <= 0
    yield RisingEdge(clk)
    rst <= 1
    for i in range(10): yield RisingEdge(clk)
    rst <= 0
    yield RisingEdge(dut.clk)

@cocotb.test()
def test (dut):

    rom = MEMORY(dut.clk, dut.ROM_addr, dut.ROM_data, 0)
    ram = MEMORY(dut.clk, dut.RAM_addr, dut.RAM_data, dut.RAM_WE)

    rom.initMemory()

    cocotb.fork(Clock(dut.clk,10,units='ns').start())
    yield AsyncReset(dut.arst)

    cocotb.fork(ram.run())
    cocotb.fork(rom.run())

    for i in range(20): yield RisingEdge(dut.clk)

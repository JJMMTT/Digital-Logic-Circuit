`timescale 1ns / 1ps

module simple_cpu_tb;

reg clk;
reg rst;

// simple_cpu 인스턴스화
simple_cpu uut(
    .clk(clk),
    .rst(rst)
);

initial begin
    // 먼저, 0을 초기값으로 설정
    clk = 0;
    forever #10 clk = ~clk; // 20ns 주기로 클록 토글
end

initial begin
    // 시뮬레이션을 위한 초기화 및 리셋
    rst = 1;  // 리셋 활성화
    #25;     // 약간의 딜레이 후
    rst = 0;  // 리셋 비활성화
    
    #100;    // 충분한 시간동안 명령 실행 관찰
    $finish; // 시뮬레이션 종료
end

// CPU 모듈의 상태 변화 모니터링
initial begin
    $monitor("시간=%g, 리셋=%b, PC=%b, 명령어=%b, regA=%b", $time, rst, uut.pc, uut.instruction, uut.regA);
end

endmodule

module simple_cpu(
    input clk,
    input rst
);

// 명령어
localparam NOP = 2'b00; // No operation
localparam ADD = 2'b01; // Add two numbers

// 메모리
reg [1:0] memory [0:3]; // 2-bit memory cells
reg [1:0] pc = 2'b00; // Program counter

// 레지스터
reg [1:0] regA = 2'b00; // General purpose register A
reg [1:0] instruction; // 현재 실행 중인 명령어

// 메모리 초기화
initial begin
    memory[0] = NOP;
    memory[1] = ADD;
    memory[2] = 2'b01; // 데이터 예시: 01
    memory[3] = 2'b10; // 데이터 예시: 10
end

// CPU 동작
always @(posedge clk or negedge rst) begin
    if (rst) begin
        // 리셋 시 모든 값 초기화
        pc <= 2'b00;
        regA <= 2'b00;
    end 
    else begin
        // Fetch
        instruction = memory[pc];
        
        // Decode and Execute
        case(instruction)
            NOP: begin
                // NOP: 아무것도 수행하지 않음.
            end
            ADD: begin
                // ADD: 데이터1과 데이터2를 더해서 regA에 저장
                regA = memory[2] + memory[3];
            end
        endcase
        
        // 다음 명령어로 이동
        pc = pc + 2'b01;
    end
end

endmodule

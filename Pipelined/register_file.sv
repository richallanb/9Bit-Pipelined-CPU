module register_file(input CLK, input  write_reg, input read_reg,
							input reg [2:0] reg_src1, input reg [2:0] reg_src2, input reg [2:0]write_reg_src, input reg[3:0] write_reg_full, input [7:0] data_in, input special_op, input [2:0] special_func, input full_addr, input reg [3:0] full_reg_src,
							output reg [7:0] data1, output reg [7:0] data2, output reg [7:0] data3, output reg [7:0] data4, output reg [1:0] aro, output reg ldst);
							/* BANK A */
							reg [7:0] bank_a_reg0=0; 		// 0000
							reg [7:0] bank_a_imm=0;  		// 0001
							reg [7:0] bank_a_gen0=0; 		// 0010
							reg [7:0] bank_a_gen1=0; 		// 0011
							reg [7:0] bank_a_gen2=0; 		// 0100
							reg [7:0] bank_a_gen3=0; 		// 0101
							reg [7:0] bank_a_gen4=0; 		// 0110
							reg [7:0] bank_a_gen5=0; 		// 0111
							/* BANK B */
							reg [7:0] bank_b_setting=0;	// 1000
							reg [7:0] bank_b_gen0=0;		// 1001
							reg [7:0] bank_b_gen1=0;		// 1010
							reg [7:0] bank_b_gen2=0;		// 1011
							reg [7:0] bank_b_gen3=0;		// 1100
							reg [7:0] bank_b_gen4=0;		// 1101
							reg [7:0] bank_b_gen5=0;		// 1110
							reg [7:0] bank_b_gen6=0;		// 1111
							/* Special unseen regs */
							reg [7:0] tally_count = 0;
							reg [7:0] max=0;
							reg [7:0] tally_regs [0:63]=	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
																	 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
																	 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
																	 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	
							always@(*)
							begin
								
								if (read_reg&~full_addr)
								begin
									if  (!special_op || 
										 (special_op && (special_func[2:0] == 3'b100 ||
															  special_func[2:0] == 3'b110)))
									begin
										case ({bank_b_setting[1],reg_src1[2:0]})
											4'b0000:data1= bank_a_reg0;
											4'b0001:data1= bank_a_imm;
											4'b0010:data1= bank_a_gen0;
											4'b0011:data1= bank_a_gen1;
											4'b0100:data1= bank_a_gen2;
											4'b0101:data1= bank_a_gen3;
											4'b0110:data1= bank_a_gen4;
											4'b0111:data1= bank_a_gen5;
											
											4'b1000:data1= bank_b_setting;
											4'b1001:data1= bank_b_gen0;
											4'b1010:data1= bank_b_gen1;
											4'b1011:data1= bank_b_gen2;
											4'b1100:data1= bank_b_gen3;
											4'b1101:data1= bank_b_gen4;
											4'b1110:data1= bank_b_gen5;
											4'b1111:data1= bank_b_gen6;
										endcase
										case ({bank_b_setting[0],reg_src2[2:0]})
										
											4'b0000:data2= bank_a_reg0;
											4'b0001:data2= bank_a_imm;
											4'b0010:data2= bank_a_gen0;
											4'b0011:data2= bank_a_gen1;
											4'b0100:data2= bank_a_gen2;
											4'b0101:data2= bank_a_gen3;
											4'b0110:data2= bank_a_gen4;
											4'b0111:data2= bank_a_gen5;
											
											4'b1000:data2= bank_b_setting;
											4'b1001:data2= bank_b_gen0;
											4'b1010:data2= bank_b_gen1;
											4'b1011:data2= bank_b_gen2;
											4'b1100:data2= bank_b_gen3;
											4'b1101:data2= bank_b_gen4;
											4'b1110:data2= bank_b_gen5;
											4'b1111:data2= bank_b_gen6;
										endcase
									end
									else // Using a special op
									begin
										case (special_func[2:0])
										3'b000: 	begin // MFL
														data1 = bank_b_gen5;
														data2 = bank_a_gen5;
														data3 = bank_a_gen4;
														data4 = bank_b_gen6;
													end
										3'b001: begin // SPC
													case ({bank_b_setting[1],reg_src1[2:0]})
														4'b0000:data1= bank_a_reg0;
														4'b0001:data1= bank_a_imm;
														4'b0010:data1= bank_a_gen0;
														4'b0011:data1= bank_a_gen1;
														4'b0100:data1= bank_a_gen2;
														4'b0101:data1= bank_a_gen3;
														4'b0110:data1= bank_a_gen4;
														4'b0111:data1= bank_a_gen5;
														
														4'b1000:data1= bank_b_setting;
														4'b1001:data1= bank_b_gen0;
														4'b1010:data1= bank_b_gen1;
														4'b1011:data1= bank_b_gen2;
														4'b1100:data1= bank_b_gen3;
														4'b1101:data1= bank_b_gen4;
														4'b1110:data1= bank_b_gen5;
														4'b1111:data1= bank_b_gen6;
													endcase
													data2 = bank_a_gen5;
												 end
										3'b010:	begin // MFH
														data1 = bank_b_gen4;
														data2 = bank_a_gen5;
														data3 = bank_a_gen4;
														data4 = bank_b_gen6;
													end
										3'b011:	begin // ISC
														data1 = bank_b_gen6;
														data2 = bank_a_gen4;
													end
										// 3'b100: 	// INC Can be handled by regular register call
										3'b101: data1 = bank_a_gen5; // SM
										3'b111: data1 = tally_count;
										endcase
									end
								end
								else if (read_reg&full_addr)
								begin
									case (full_reg_src[3:0])
										4'b0000:data1= bank_a_reg0;
										4'b0001:data1= bank_a_imm;
										4'b0010:data1= bank_a_gen0;
										4'b0011:data1= bank_a_gen1;
										4'b0100:data1= bank_a_gen2;
										4'b0101:data1= bank_a_gen3;
										4'b0110:data1= bank_a_gen4;
										4'b0111:data1= bank_a_gen5;
												
										4'b1000:data1= bank_b_setting;
										4'b1001:data1= bank_b_gen0;
										4'b1010:data1= bank_b_gen1;
										4'b1011:data1= bank_b_gen2;
										4'b1100:data1= bank_b_gen3;
										4'b1101:data1= bank_b_gen4;
										4'b1110:data1= bank_b_gen5;
										4'b1111:data1= bank_b_gen6;
									endcase
								end
								aro = bank_b_setting[3:2];
								ldst = bank_b_setting[4];
							end
						
						always @ (posedge CLK)
						begin
							if (write_reg&~full_addr)
							begin
								if  (!special_op || 
										 (special_op && (special_func[2:0] == 3'b100 || 
															  special_func[2:0] == 3'b111 )))
								begin
									case ({bank_b_setting[0],write_reg_src[2:0]})
											4'b0001: bank_a_imm <= data_in;
											4'b0010: bank_a_gen0 <= data_in;
											4'b0011: bank_a_gen1 <= data_in;
											4'b0100: bank_a_gen2 <= data_in;
											4'b0101: bank_a_gen3 <= data_in;
											4'b0110: bank_a_gen4 <= data_in;
											4'b0111: bank_a_gen5 <= data_in;
											
											4'b1000: bank_b_setting <= data_in;
											4'b1001: bank_b_gen0 <= data_in;
											4'b1010: bank_b_gen1 <= data_in;
											4'b1011: bank_b_gen2 <= data_in;
											4'b1100: bank_b_gen3 <= data_in;
											4'b1101: bank_b_gen4 <= data_in;
											4'b1110: bank_b_gen5 <= data_in;
											4'b1111: bank_b_gen6 <= data_in;
									endcase
								end
								else	// Using a special op
								begin
									case (special_func[2:0])
									3'b000: bank_b_gen5 <= data_in;// MFL
									3'b001: bank_a_gen5 <= data_in; // SPC
									3'b010: bank_b_gen4 <= data_in; // MFH
									
									3'b011: bank_b_gen6 <= data_in; // ISC
									// 3'b100: // INC can be handled with regular register call
									3'b101: bank_a_gen5 <= data_in; // SM
									3'b110: 
										begin
											tally_regs[data_in] = tally_regs[data_in] +1;
		
											if (tally_regs[data_in] > tally_count)
											begin
												tally_count <= tally_regs[data_in];
												max <= data_in;
												bank_a_gen1 <= data_in;
											end
											else if (tally_regs[data_in] == tally_count && data_in < max)
											begin
												tally_count <= tally_regs[data_in];
												max <= data_in;
												bank_a_gen1 <= data_in;
												
											end
										end
									endcase
								
								end
							end
							
						else if (write_reg&full_addr)
						begin
							case (write_reg_full[3:0])
								4'b0001: bank_a_imm <= data_in;
								4'b0010: bank_a_gen0 <= data_in;
								4'b0011: bank_a_gen1 <= data_in;
								4'b0100: bank_a_gen2 <= data_in;
								4'b0101: bank_a_gen3 <= data_in;
								4'b0110: bank_a_gen4 <= data_in;
								4'b0111: bank_a_gen5 <= data_in;
									
								4'b1000: bank_b_setting <= data_in;
								4'b1001: bank_b_gen0 <= data_in;
								4'b1010: bank_b_gen1 <= data_in;
								4'b1011: bank_b_gen2 <= data_in;
								4'b1100: bank_b_gen3 <= data_in;
								4'b1101: bank_b_gen4 <= data_in;
								4'b1110: bank_b_gen5 <= data_in;
								4'b1111: bank_b_gen6 <= data_in;
							endcase
						end
					bank_a_reg0<=0;
					end
endmodule

		
/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_arst_sync.v
 *  Purpose:  Reset synchronizer with asynchronous reset assertion
 *            and clock synchronous deassertion.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module hbmc_arst_sync #
(
    parameter integer C_SYNC_STAGES = 3
)
(
    input   wire    clk,
    input   wire    arstn,
    output  wire    rstn
);
    
    hbmc_bit_sync #
    (
        .C_SYNC_STAGES  ( C_SYNC_STAGES ),
        .C_RESET_STATE  ( 1'b0          )
    )
    hbmc_bit_sync_inst
    (
        .arstn  ( arstn ),
        .clk    ( clk   ),
        .d      ( 1'b1  ),
        .q      ( rstn  )
    );
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Oral confession
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        //
//    Q: We are the investigators of xiadu Police Station. Today we are questioning you in accordance with the law. You should answer our questions truthfully and assist in the investigation. You have the right to make a statement about the circumstance and defend, shall have the right to refuse to answer questions on irrelevant to the case, have the right to put forward the case, head of the personnel handling the case, expert witnesses a withdrawal application, has the right to check the interrogation record, the record record errors or omissions corrections or check the interrogation record, the record record wrong or omissions correction or supplement opinions are put forward. If your answer involves state secrets, trade secrets or personal privacy, the case-handling authorities will keep it confidential. Have you heard the above clearly?    //
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract OC is ERC721Creator {
    constructor() ERC721Creator("Oral confession", "OC") {}
}
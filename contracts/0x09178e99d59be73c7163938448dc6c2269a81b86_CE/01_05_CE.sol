// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Contemporary Elegance
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                           //
//                                                                                           //
//                                                                                           //
//     #####                                                                                 //
//    #     #  ####  #    # ##### ###### #    # #####   ####  #####    ##   #####  #   #     //
//    #       #    # ##   #   #   #      ##  ## #    # #    # #    #  #  #  #    #  # #      //
//    #       #    # # #  #   #   #####  # ## # #    # #    # #    # #    # #    #   #       //
//    #       #    # #  # #   #   #      #    # #####  #    # #####  ###### #####    #       //
//    #     # #    # #   ##   #   #      #    # #      #    # #   #  #    # #   #    #       //
//     #####   ####  #    #   #   ###### #    # #       ####  #    # #    # #    #   #       //
//                                                                                           //
//    #######                                                                                //
//    #       #      ######  ####    ##   #    #  ####  ######                               //
//    #       #      #      #    #  #  #  ##   # #    # #                                    //
//    #####   #      #####  #      #    # # #  # #      #####                                //
//    #       #      #      #  ### ###### #  # # #      #                                    //
//    #       #      #      #    # #    # #   ## #    # #                                    //
//    ####### ###### ######  ####  #    # #    #  ####  ######                               //
//                                                                                           //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////


contract CE is ERC721Creator {
    constructor() ERC721Creator("Contemporary Elegance", "CE") {}
}
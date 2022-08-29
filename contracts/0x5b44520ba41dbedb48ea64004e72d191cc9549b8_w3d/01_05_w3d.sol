// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Web3Domains.com
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
//     __          __  _    ____  _____                        _                                                                                                                                                  //
//     \ \        / / | |  |___ \|  __ \                      (_)                                                                                                                                                 //
//      \ \  /\  / /__| |__  __) | |  | | ___  _ __ ___   __ _ _ _ __  ___   ___ ___  _ __ ___                                                                                                                    //
//       \ \/  \/ / _ \ '_ \|__ <| |  | |/ _ \| '_ ` _ \ / _` | | '_ \/ __| / __/ _ \| '_ ` _ \                                                                                                                   //
//        \  /\  /  __/ |_) |__) | |__| | (_) | | | | | | (_| | | | | \__ \| (_| (_) | | | | | |                                                                                                                  //
//         \/  \/ \___|_.__/____/|_____/ \___/|_| |_| |_|\__,_|_|_| |_|___(_)___\___/|_| |_| |_|                                                                                                                  //
//                                                                                                                                                                                                                //
//     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                                                                                                                                                                            //
//     |W|e|b|3|D|o|m|a|i|n|s|.|c|o|m|                                                                                                                                                                            //
//     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                                                                                                                                                                            //
//                                                                                                                                                                                                                //
//     57 65 62 33 44 6F 6D 61 69 6E 73 2E 63 6F 6D                                                                                                                                                               //
//                                                                                                                                                                                                                //
//     87 101 98 51 68 111 109 97 105 110 115 46 99 111 109                                                                                                                                                       //
//                                                                                                                                                                                                                //
//     127 145 142 063 104 157 155 141 151 156 163 056 143 157 155                                                                                                                                                //
//                                                                                                                                                                                                                //
//     .-- . -... ...-- -.. --- -- .- .. -. ... .-.-.- -.-. --- --                                                                                                                                                //
//                                                                                                                                                                                                                //
//     01010111 01100101 01100010 00110011 01000100 01101111 01101101 01100001 01101001 01101110 01110011 00101110 01100011 01101111 01101101                                                                     //
//                                                                                                                                                                                                                //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((,     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((          (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((              *@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((                  @@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((                      @@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@#((((((((((((((((((((((((( ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((                          @@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((( (((((((((((((((((((((((((((((((((((((((((((((((((((((((((                             @@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@%((((((((((((((((((((((((((((   (((((((((((((((((((((((((((((((((((((((((((((((((((((((                                @@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@((((((((((((((((((((((((((((((   ((((((((((((((((((((((((((((((((((((((((((((((((((((((                                   @@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@(((((((((((((((((((((((((((((((     (((((((((((((((((((((((((((((((((((((((((((((((((((,                                   ##@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@((((((((((((((((((((((((((((((((     ((((((((((((((((((((((((((((((((((((((((((((((((((                                    #####@@@@@@@@@@                                                      //
//    @@@@@@@@@@&((((((((((((((((((((((((((((((((       ((((((((((((((((((((((((((((((((((((((((((((((((                                   ########@@@@@@@@@                                                      //
//    @@@@@@@@@((((((((((((((((((((((((((((((((((       (((((((((((((((((((((((((((((((((((((((((((((((                                  ###########@@@@@@@@                                                      //
//    @@@@@@@@(((((((((((((*((((((((((((((((((((        .(((((((((((((((((((((((((((((((((((((((((((((                                  #############@@@@@@@                                                      //
//    @@@@@@@(((((((((((((((((((((((((((((((((((         (((((((((((((((((((((((((((((((((((((((((((                                  ################@@@@@@                                                      //
//    @@@@@@(((((((((((((((( ((((((((((((((((((.         ((((((((((((((((((((((((((((((((((((((((((                                 ###################@@@@@                                                      //
//    @@@@@@((((((((((((((((*((((((((((((((((((           ((((((((((((((((((((((((((((((((((((((((                                ######################@@@@                                                      //
//    @@@@@(((((((((((((((((( ((((((((((((((((/           (((((((((((((((((((((((((((((((((((((((                                #######################@@@@                                                      //
//    @@@@(((((((((((((((((((  (((((((((((((((             ((((((((((((((((((((((((((((((((((((.                               ##########################@@@                                                      //
//    @@@@(((((((((((((((((((( (((((((((((((((             (((((((((((((((((((((((((((((((((((                               ############################@@@                                                      //
//    @@@@((((((((((((((((((((  (((((((((((((               (((((((((((((((((((((((((((((((((                              ,##############################@@                                                      //
//    @@@(((((((((((((((((((((  (((((((((((((       (       ((((((((((((((((((((((((((((((((                              ################################@@                                                      //
//    @@@((((((((((((((((((((((  (((((((((((       ((       .((((((((((((((((((((((((((((((                             ##################################@@                                                      //
//    @@@((((((((((((((((((((((   ((((((((((       ((        ((((((((((((((((((((((((((((                             ####################################@@                                                      //
//    @@@(((((((((((((((((((((((  (((((((((       ((((       (((((((((((((((((((((((((((                             #####################################@@                                                      //
//    @@@(((((((((((((((((((((((   ((((((((       ((((        (((((((((((((((((((((((((                            #######################################@@                                                      //
//    @@@(((((((((((((((((((((((   *((((((       ((((((       ((((((((((((((((((((((((                           #########################################@@                                                      //
//    @@@((((((((((((((((((((((((   ((((((      (((((((        (((((((((((((((((((((                           /##########################################@@                                                      //
//    @@@@(((((((((((((((((((((((    ((((       (((((((        ((((((((((((((((((((                           ############################################@@                                                      //
//    @@@@((((((((((((((((((((((((   ((((      (((((((((        ((((((((((((((((((                          #############################################@@@                                                      //
//    @@@@@(((((((((((((((((((((((    ((       (((((((((        (((((((((((((((((                         ###############################################@@@                                                      //
//    @@@@@(((((((((((((((((((((((     (      (((((((((((       ,((((((((((((((/                         ###############################################@@@@                                                      //
//    @@@@@@(((((((((((((((((((((((           (((((((((((        (((((((((((((                         #################################################@@@@                                                      //
//    @@@@@@@((((((((((((((((((((((          ((((((((((((        ((((((((((((                        ##################################################@@@@@                                                      //
//    @@@@@@@((((((((((((((((((((((.        /(((((((((((((        ((((((((((                       (##################################################@@@@@@                                                      //
//    @@@@@@@@((((((((((((((((((((((        ((((((((((((((        (((((((((                       ###################################################@@@@@@@                                                      //
//    @@@@@@@@@@((((((((((((((((((((       ((((((((((((((((        ((((((                       ####################################################@@@@@@@@                                                      //
//    @@@@@@@@@@@((((((((((((((((((((      ((((((((((((((((        (((((                      #####################################################@@@@@@@@@                                                      //
//    @@@@@@@@@@@@(((((((((((((((((((     (((((((((((((((((         (((                      ####################################################@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@%(((((((((((((((((     ((((((((((((((((((        ((                     #####################################################@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@(((((((((((((((((   (((((((((((((((((((        .                    #####################################################@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@(((((((((((((((  /((((((((((((((((((((                          ######################################################@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@(((((((((((((( (((((((((((((((((((((                         #####################################################@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@((((((((((((((((((((((((((((((((((                       #####################################################@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((                    ####################################################@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((((((((((((((((((((                  .###################################################@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((                ##################################################@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@((((((((((((((((((((((((((              #################################################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@((((((((((((((((((((((            ###############################################(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((          #############################################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((        ##########################################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@((((((((((     ######################################[email protected]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((   ,################################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%###%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//                                                                                                                                                                                                                //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@(((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@((((((((((((((((   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@((((((.((((((((((      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@((/(((  ((((((((.      ###@@###@@@@@@####@@@@@###@@@##########@@@###@@@@#####@@##########@@@((((((((((((@@@@@@(((((((((((@@@@@(((@@@@@@@@@(((@@@@@@@(((((@@@@@@@(((@@@@((((@@@@@(((@@@((((@@@(((@@    //
//    @@@@@(((((((  (((((((      #####@@@###@@@@##@##@@@@###@@@@###@@@@@@@@@@###@@@@@@###@@@@@@@###@@@@@(((@@@@@@@@(((@@(((@@@@@@@@@(((@@@(((((@@@@@(((((@@@@@@(((@@((@@@@@@(((@@@@((((((@@@(((@@@(((@@@@@@@@@    //
//    @@@@@(((( (,   (((((     (#######@@@###@@###@@##@@@##@@@@@#########@@@@###########@@@@@@@######@@@(((@@@@@@@@@((@@(((@@@@@@@@@(((@@@((@@((@@@((@@((@@@@@(((@@@@((@@@@@(((@@@@((@@((((@(((@@@@@(((((((@@@    //
//    @@@@@(((((( (( ((((     ########@@@@@######@@@@##@##@@@@@@###@@@@@@@@@@###@@@@@@@###@@@@@@@@@###@@(((@@@@@@@@(((@@(((@@@@@@@@@(((@@@((@@@(((((@@@((@@@@(((((((((((@@@@(((@@@@((@@@@((((((@@@@@@@@@@@(((@    //
//    @@@@@@((((  ((  ((    ##########@@@@@@####@@@@@#####@@@@@@###########@@#############@##########@@@((((((((((((@@@@@@(((((((((((@@@@@((@@@@@(@@@@@((@@@(((@@@@@@@@(((@@(((@@@@((@@@@@@((((@@@((((((((((@@    //
//    @@@@@@@((( ((((     ##########@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@((((((   .#########&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@((  ########@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract w3d is ERC1155Creator {
    constructor() ERC1155Creator() {}
}
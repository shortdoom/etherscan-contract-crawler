// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Reza Nia
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//    ██████  ███████ ███████  █████      ███    ██ ██  █████                                                 //
//    ██   ██ ██         ███  ██   ██     ████   ██ ██ ██   ██                                                //
//    ██████  █████     ███   ███████     ██ ██  ██ ██ ███████                                                //
//    ██   ██ ██       ███    ██   ██     ██  ██ ██ ██ ██   ██                                                //
//    ██   ██ ███████ ███████ ██   ██     ██   ████ ██ ██   ██                                                //
//                                                                                                            //
//                                                                                                            //
//    ██████  ██   ██  ██████  ████████  ██████   ██████  ██████   █████  ██████  ██   ██ ██    ██            //
//    ██   ██ ██   ██ ██    ██    ██    ██    ██ ██       ██   ██ ██   ██ ██   ██ ██   ██  ██  ██             //
//    ██████  ███████ ██    ██    ██    ██    ██ ██   ███ ██████  ███████ ██████  ███████   ████              //
//    ██      ██   ██ ██    ██    ██    ██    ██ ██    ██ ██   ██ ██   ██ ██      ██   ██    ██               //
//    ██      ██   ██  ██████     ██     ██████   ██████  ██   ██ ██   ██ ██      ██   ██    ██               //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//    &&&&&&&&&&&#&&###&&#################################################################################    //
//    &&&&#&&&&&##########################################################################################    //
//    &&&##&&###&#########################################################################################    //
//    &&#&&###&####&######################################################################################    //
//    &#######&&&&&&&##&&#################################################################################    //
//    #####&##&&&&&&&&#############################GB#####################################################    //
//    ###&&&##&&&##&&###########################B57!75B###################################################    //
//    #&&&###&&&###############################Y7~~~7?JYG#################################################    //
//    &&&&&&&&&##############################G?!~:..:^7JJ5B###############################################    //
//    &&#&#################################BJ!^:....:::^7JJP##############################################    //
//    &##################################&P7~:......:::::^7J5#############################################    //
//    ###############################&&&&P7~...^7!!J?!JJ^::!J5#&&&##BB####################################    //
//    ######&####################&&&&&&&5!^....JPPPJ5BBG7:::~?Y#@&&&&#####################################    //
//    #####&####&###############&&&&&&&5!^.....:~!7^!7?!^:^^^^?5&&&&&&&&##################################    //
//    ####&########&&#########&&&&&&&@B!^..........^?^::::^^^^[email protected]&&&&&&&&################################    //
//    ##&&&########&&#######&&&&&&&&@&J~...........:7?::::^^^~~!5#@&&&&&##################################    //
//    #&&&#################&@@&&####&B7:.............::::^^^[email protected]&&&&###################################    //
//    ##&&#################&@&#######BY^........::^~~~^^:^^~~~!!?P&@&&##&#################################    //
//    #####################&@&####&&&&&BJ^..:^!777??J???7!~~~!!77P&@&&&&&&&&@&############################    //
//    &########&#&###&#####&&##&&&&&&&&&&B?!!77!777777?77??7!!7JP#&&&&&@@@@@@@############################    //
//    #&&##################&&&&&&&&&&&@@@@@GJ7!!!7777??777?PGB#&&&&&&&&&&&&@@&############################    //
//    ######################&&&&&@@@@@@@@&#BBGY!!77777777Y#&&&&&&&&&&&&&&&&@@#############################    //
//    #######################&&@@@@@@@@@#BBBGBBGJ!!!!777J&&##&&@&&&&&&&&&&@@&###########################&#    //
//    ##############&####&####&@@@@@@@@&BBBBBGGPP?!~~!7Y#####&&@@&&&&&&&&@&&##########################&&&&    //
//    ####################&####&&@@@@@@#B##PJ7!!~~!7~75GPYY5G&&@@&&&&&&@@&#############################&&&    //
//    ##########################&&&@@@@#&@PJ5555PPY??5BBBGGGG#@@@@@@@@@&&###########################&#####    //
//    #######################&&&&&&&&@BP&&YJPGGGGP5?!5BGGB##BB&B&@@@&&#############################&&&##&#    //
//    ####################&&&&&&&&&&#&5?PGY?777??7!7~?5JJ5P5PB#G&&&#############&#&&&##############&&&&&&&    //
//    #####################&&&&&&&&&#&B?!Y5J?7!~~~!!~!YY??JYPBGB########&####&&&&&&&&&&#####&&&###&#&&####    //
//    #####################&&&&&&&&###&#PPPYYJ?!!~?JJ5G5JJ5PGGB########&#####&&&&&&&&&&###&####&&&&&&&####    //
//    ######################&&##&&&####&&@#YYJ?7!!77JY5YY5PGB#################&&&##&&&&&&######&&&&&&&&&##    //
//    ###&######################&&&#####&@@BYYJ??JYY5PGPPGGB################&&#&&&##&&&&&#####&&&&&&&&&&&&    //
//    #########################&&&&####&&@@&YYYJ?777JYY5PGB&##############&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    ############################&##&&@#GP5J?Y5YJ?JYY5PGGB#########&####&&&&&#&#&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    ###########################&&&&&BY!~~!77?J5PGBBBGGGGGPPB#&##&&&&&&&&&&&###&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    ###################&&&&&&&&&&&GJ~^~^~!~77?JY5GGBGGGGBGPPPB&&&######&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    #################&&&&&&&&&&&BJ~^^^^^^~!~7?JY5PPGGGGGPBBGP5G#BGGGGGGGB#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    ##########&#&#&&#BGGGGGPPPPJ!^~~~^~~~^!7!JY5PPGGGGBG5PGGPYJY5PPGGGGP5PB&&&&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    #############&#BP55PPP5JJ?7!~~~~!~^~~^~77~J5PGGPPG#PJJP5YYJ??J55PPPPGPPG&&&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    #####&&&&#####55555555YJ7!!7!~~~~~~~~^^~?!!J5P5J5GPP??JYJ????7?YY5GGPGG5P&&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &####&&######5Y5PPP5PY?7!~!!!!77!~!~^~^~!J!~J5Y7JYYYJ77JJ?77777?JY5GGPPGPB&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &######&&&#&BJ5PPP5YY?7!!~!!77??7!~!~~~~~??~!JJ77?JY57~7J??!!!77?Y5GGP5PGP&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    #####&#&&&&&PYPGGP5JJ?7!!!!!77??7!!!!~~~~!J7~!JJ??JY5J~!??7!!!!!7J5GBP555G&&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &####&&&&&&#Y5PGGGGYJ?7!!~!!77??77!!?!!~~!??!~!?J?JJYY7~!?77!!!!7?YGBG5P55#&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    ######&&&&&GYPGGGGGYY?7!!!!!77??77!!77!~~~7?!~~!JJ?JJJJ!!?77!!!!!7?5BG5PGPG&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&#####&&&&PYPGGGG5JYJ7!!!!!77??77!!77~^^~!??~!!7YGGBB#5~7?77!!!!7?5GPPBGPG&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&###&&&[email protected]@@@&?7J?77!!!7?YP5GBBBP&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&####&&&GPPPPP5YY5Y?7!!!!77?J??7!77!!~~!7??!!77?#@@@@5!J77!!!7??JPPPBBBGG&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&BPGGGB55555J77!!!77?J??7!77!!~~!77?!!7?!J&@&@G!?777777??J5PPGBBBP#&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&[email protected]&&#77?77777?JJYGPPBBGPP&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&#GGGGBP5555?77!!!!7???JJ777?!!!777777777??#@&@Y?J?????JYY5GBPPGGGG#&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&#[email protected]@@5?JJJ??JY55PBBP5GBBG&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&[email protected]@@5?JJJJJY55PGBGGPBBGB&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&[email protected]@@Y?YYJYYY5PPGGGGGGGG#@&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&[email protected]@&JJYYYY55PPPGGGBB#&&@&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&#[email protected]@BJ55YYY5PPPBB#&&@@@&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&&#GG55YJ???7!!77???????JJ?????77!!!J5P#@@[email protected]@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&&&BBB5JJ???JYPP55YYYYYYJJJJJ??77777?YP#@&55YJJY5PGGB&#BB#&&&&@&&@&&&&&&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&&&&BGGP55B#&&[email protected]&@&&&@@@@&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&&&&&#BBB&&#GPYJYJJJJY55JJ?7???????JJ?7J##[email protected]@&@@@@&&&&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&&&&&&&&&BY???7777777??????????????7??77JPY5J?JY5PP#[email protected]@@@&&@@@@&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&&&&&&&&&PJJ?77777777777777777777777777!!~!7!77????YJ???5BGP5Y5GBGPYJJYPGB&&&&&&&&&&&&    //
//    &&&&&&&&&&&&&&&&&&&&&&#P555YYJJJJ??????????77777777777!:.:::::::.~J??JJYYJ?????777??????JY5#&&&&&&&&    //
//    &&&&&&&&&&&&&&&&&&&&&&&BGGPP5555YYYYYJJJJ???????????777^^^^^^^^^:!?????777777777???JJ?JJJ5PG#&&&&&&&    //
//    &&&&&&&&&&&&&&&&&&&&&&&&##GGGPPPPPP555555YYYYYJJJJJ????77777777!7JYJJYJ??7777??JJJJJJJJ5G#BB#BBB###B    //
//    BBBBBBBBBBBBBB######BB####BBBBBBBBBBBGBBBBBGGGGGGGGGGGBBBBBBBBBBBB#BB#BGGGGGGGB##&&#BGB&&&&&&BB#####    //
//    BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBGGGGGGGGGGGGGGGGGGGBGGGGGGGGGBBGGGGGGGGGGGBBBGGBBBBBBBBB###BBBBBBBBBBB    //
//    BBBBBBGBBBBBGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGPPPPPPPGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG    //
//    BBBBBBGBBGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGPPPGGGGGGGGGGGGPPPPPPGGGGGPPPPPPGPPPPPGGGGGGGGGGGGGGGGGB    //
//    BBBBBBBBBBGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGPPPPPPPPGGGGGGGGPPPPPPGGGGGGGGGGGGGPPPGGGGPPPPPGGGGGGGGB    //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract RZNART is ERC1155Creator {
    constructor() ERC1155Creator() {}
}
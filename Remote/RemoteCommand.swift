//
//  RemoteCommand.swift
//  Remote
//
//  Created by Klaus Meyer on 05.11.19.
//  Copyright © 2019 Klaus Meyer. All rights reserved.
//

import Foundation

// Mapping of keys to IRCC codes.
// See https://pro-bravia.sony.net/develop/integrate/ircc-ip/ircc-codes/

enum RemoteCommand: String {
    case power        = "AAAAAQAAAAEAAAAvAw=="
    case input        = "AAAAAQAAAAEAAAAlAw=="
    case ok           = "AAAAAQAAAAEAAABlAw=="
    case vol_down     = "AAAAAQAAAAEAAAATAw=="
    case mute         = "AAAAAQAAAAEAAAAUAw=="
    case vol_up       = "AAAAAQAAAAEAAAASAw=="
    case num_1        = "AAAAAQAAAAEAAAAAAw=="
    case num_2        = "AAAAAQAAAAEAAAABAw=="
    case num_3        = "AAAAAQAAAAEAAAACAw=="
    case num_4        = "AAAAAQAAAAEAAAADAw=="
    case num_5        = "AAAAAQAAAAEAAAAEAw=="
    case num_6        = "AAAAAQAAAAEAAAAFAw=="
    case num_7        = "AAAAAQAAAAEAAAAGAw=="
    case num_8        = "AAAAAQAAAAEAAAAHAw=="
    case num_9        = "AAAAAQAAAAEAAAAIAw=="
    case num_0        = "AAAAAQAAAAEAAAAJAw=="
    case channel_up   = "AAAAAQAAAAEAAAAQAw=="
    case channel_down = "AAAAAQAAAAEAAAARAw=="
}

package com.KioskSNU.snu.dto;

import lombok.*;

@Data
public class RoomDTO {
    private int id;
    private int roomNumber;
    private int roomType_id;
    private String roomType_name;
    private int roomType_price;
    private boolean usable;
}

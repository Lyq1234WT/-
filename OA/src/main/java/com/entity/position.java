package com.entity;

import lombok.Data;

@Data
public class position {
    private int id;
    private String posotion;

    public position(int id, String posotion) {
        this.id = id;
        this.posotion = posotion;
    }

    public position() {
    }
}

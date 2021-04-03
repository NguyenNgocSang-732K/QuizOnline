package com.model.mapper;

import com.model.entities.Level;
import com.model.entityModels.LevelModel;

public class LevelMapper {
    public static LevelModel ToLevelModel(Level levelEntity) {
        return new LevelModel(levelEntity.getId(), levelEntity.getName(), levelEntity.getCreatedDate(),
                levelEntity.getCreatedBy(), levelEntity.getStatus());
    }
}

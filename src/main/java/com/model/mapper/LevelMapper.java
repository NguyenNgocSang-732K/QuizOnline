package com.model.mapper;

import com.constant.StatusEnum;
import com.model.entities.Level;
import com.model.entityModels.LevelInputModel;
import com.model.entityModels.LevelModel;

public class LevelMapper {
	public static LevelModel ToLevelModel(Level levelEntity) {
		LevelModel levelModel = new LevelModel();
		levelModel.setId(levelEntity.getId());
		levelModel.setName(levelEntity.getName());
		levelModel.setCreatedDate(levelEntity.getCreatedDate());
		levelModel.setCreatedBy(levelEntity.getCreatedBy());
		levelModel.setStt(levelEntity.getStt());

		if (levelEntity.getStatus() == StatusEnum.VISIBLE.getKey()) {
			levelModel.setStatus(true);
		} else if (levelEntity.getStatus() == StatusEnum.INVISIBLE.getKey()) {
			levelModel.setStatus(false);
		}

		return levelModel;
	}

	public static Level ToLevelEntity(LevelModel levelModel) {

		Level level = new Level();
		level.setId(levelModel.getId());
		level.setName(levelModel.getName());
		level.setCreatedDate(levelModel.getCreatedDate());
		level.setCreatedBy(levelModel.getCreatedBy());
		level.setStt(levelModel.getStt());
		if (levelModel.isStatus()) {
			level.setStatus(StatusEnum.VISIBLE.getKey());
		} else {
			level.setStatus(StatusEnum.INVISIBLE.getKey());
		}

		return level;
	}

	public static LevelInputModel ToLevelInputModel(Level levelEntity) {
		LevelInputModel levelModel = new LevelInputModel();
		levelModel.setId(levelEntity.getId());
		levelModel.setName(levelEntity.getName());
		levelModel.setCreatedBy(levelEntity.getCreatedBy());
		levelModel.setStt(levelEntity.getStt());

		return levelModel;
	}

}

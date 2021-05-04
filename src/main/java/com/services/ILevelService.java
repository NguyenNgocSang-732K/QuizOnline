package com.services;

import com.model.entities.Level;
import com.model.entityModels.LevelInputModel;
import com.model.entityModels.LevelModel;

import java.util.List;

public interface ILevelService {
	
	Level FindById(int id);
	
    List<LevelModel> GetAll();
    
    List<LevelModel> FindAllModelValid();

    int Create(LevelInputModel model, int userId);

    Level Update(LevelInputModel model);
}

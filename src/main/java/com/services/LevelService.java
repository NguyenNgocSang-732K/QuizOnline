package com.services;

import com.model.entityModels.LevelModel;
import com.model.mapper.LevelMapper;
import com.repository.LevelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service("levelService")
public class LevelService implements ILevelService {
    @Qualifier("levelRepository")
    private @Autowired
    LevelRepository _levelRepository;

    @Override
    public List<LevelModel> GetAll() {
        return _levelRepository.findAll()
                .stream()
                .map(LevelMapper::ToLevelModel)
                .collect(Collectors.toList());
    }
}

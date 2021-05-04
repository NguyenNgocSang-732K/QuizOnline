package com.services;

import com.constant.StatusEnum;
import com.model.entities.Level;
import com.model.entityModels.LevelModel;
import com.model.mapper.LevelMapper;
import com.repository.LevelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service("levelService")
public class LevelService implements ILevelService {
	@Qualifier("levelRepository")
	private @Autowired LevelRepository _levelRepository;

	@Override
	public List<LevelModel> GetAll() {
		return _levelRepository.findAll().stream().map(LevelMapper::ToLevelModel).collect(Collectors.toList());
	}

	@Override
	public List<LevelModel> FindAllModelValid() {
		return _levelRepository.findLevelByStatusOrderByStt(StatusEnum.VISIBLE.getKey()).stream()
				.map(LevelMapper::ToLevelModel).collect(Collectors.toList());
	}

	@Override
	public Level FindById(int id) {
		// TODO Auto-generated method stub
		Optional<Level> level = _levelRepository.findById(id);
		if (level.isEmpty()) {
			return null;
		}
		return level.get();
	}
}

package com.services;

import com.constant.StatusEnum;
import com.model.entities.Level;
import com.model.entities.Subject;
import com.model.entityModels.LevelInputModel;
import com.model.entityModels.LevelModel;
import com.model.mapper.LevelMapper;
import com.repository.LevelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Date;
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
	public int Create(LevelInputModel model, int userId) {
		Level level = new Level();

		level.setName(model.getName());
		level.setCreatedDate(new Date());
		level.setCreatedBy(userId);
		level.setStt(model.getStt());
		level.setStatus(StatusEnum.VISIBLE.getKey());

		level = _levelRepository.save(level);

		return level.getId();
	}

	@Override
	public Level Update(LevelInputModel model) {
		Level level = this.FindById(model.getId());
		if (level == null) {
			return null;
		}
		// --
		level.setName(model.getName());
		level.setStt(model.getStt());
		// --
		Level levelSaved = _levelRepository.save(level);
		return levelSaved;
	}

	@Override
	public Level FindById(int id) {
		// TODO Auto-generated method stub
		Optional<Level> level = _levelRepository.findById(id);
		if (!level.isPresent()) {
			return null;
		}
		return level.get();
	}

	@Override
	public boolean UpdateStatus(int levelId, boolean status) {
		Level level = this.FindById(levelId);

		if (status)
			level.setStatus(StatusEnum.VISIBLE.getKey());
		else
			level.setStatus(StatusEnum.INVISIBLE.getKey());

		Level levelUpdated = _levelRepository.save(level);
		return levelUpdated != null ? true : false;
	}
}

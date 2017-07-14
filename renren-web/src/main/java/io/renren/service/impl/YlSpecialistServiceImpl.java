package io.renren.service.impl;

import io.renren.dao.YlSpecialistDao;
import io.renren.entity.YlSpecialistEntity;
import io.renren.service.YlSpecialistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("ylSpecialistService")
public class YlSpecialistServiceImpl implements YlSpecialistService {
	@Autowired
	private YlSpecialistDao ylSpecialistDao;
	
	@Override
	public void save(YlSpecialistEntity specialist) {
		ylSpecialistDao.save(specialist);
	}

	@Override
	public void update(YlSpecialistEntity specialist) {
		ylSpecialistDao.update(specialist);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		ylSpecialistDao.deleteBatch(ids);
	}

	@Override
	public List<YlSpecialistEntity> queryList(Map<String, Object> map) {
		return ylSpecialistDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return ylSpecialistDao.queryTotal(map);
	}

	@Override
	public YlSpecialistEntity queryObject(Integer id) {
		return ylSpecialistDao.queryObject(id);
	}
}

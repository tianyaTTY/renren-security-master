package io.renren.service.impl;

import io.renren.dao.YlDepartmentDao;
import io.renren.entity.YlDepartmentEntity;
import io.renren.service.YlDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("ylDepartmentService")
public class YlDepartmentServiceImpl implements YlDepartmentService {
	@Autowired
	private YlDepartmentDao ylDepartmentDao;
	
	@Override
	public void save(YlDepartmentEntity department) {
		ylDepartmentDao.save(department);
	}

	@Override
	public void update(YlDepartmentEntity department) {
		ylDepartmentDao.update(department);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		ylDepartmentDao.deleteBatch(ids);
	}

	@Override
	public List<YlDepartmentEntity> queryList(Map<String, Object> map) {
		return ylDepartmentDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return ylDepartmentDao.queryTotal(map);
	}

	@Override
	public YlDepartmentEntity queryObject(Integer id) {
		return ylDepartmentDao.queryObject(id);
	}
}

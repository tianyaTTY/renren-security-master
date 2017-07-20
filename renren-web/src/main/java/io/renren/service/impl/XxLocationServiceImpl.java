package io.renren.service.impl;

import io.renren.dao.XxLocationDao;
import io.renren.entity.XxLocationEntity;
import io.renren.service.XxLocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("xxLocationService")
public class XxLocationServiceImpl implements XxLocationService {
	@Autowired
	private XxLocationDao xxLocationDao;
	
	@Override
	public void save(XxLocationEntity location) {
		xxLocationDao.save(location);
	}

	@Override
	public void update(XxLocationEntity location) {
		xxLocationDao.update(location);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		xxLocationDao.deleteBatch(ids);
	}

	@Override
	public List<XxLocationEntity> queryList(Map<String, Object> map) {
		return xxLocationDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return xxLocationDao.queryTotal(map);
	}

	@Override
	public XxLocationEntity queryObject(Integer id) {
		return xxLocationDao.queryObject(id);
	}
}

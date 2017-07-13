package io.renren.service.impl;

import io.renren.dao.YlOrganizationDao;
import io.renren.entity.YlOrganizationEntity;
import io.renren.service.YlOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service("ylOrganizationService")
public class YlOrganizationServiceImpl implements YlOrganizationService {
	@Autowired
	private YlOrganizationDao ylOrganizationDao;
	
	@Override
	public void save(YlOrganizationEntity org) {
		ylOrganizationDao.save(org);
	}

	@Override
	public void update(YlOrganizationEntity org) {
		ylOrganizationDao.update(org);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		ylOrganizationDao.deleteBatch(ids);
	}

	@Override
	public List<YlOrganizationEntity> queryList(Map<String, Object> map) {
		return ylOrganizationDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return ylOrganizationDao.queryTotal(map);
	}

	@Override
	public YlOrganizationEntity queryObject(Integer id) {
		return ylOrganizationDao.queryObject(id);
	}
}

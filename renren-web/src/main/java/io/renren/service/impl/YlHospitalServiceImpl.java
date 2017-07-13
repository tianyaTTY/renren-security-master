package io.renren.service.impl;

import io.renren.dao.YlHospitalDao;
import io.renren.dao.YlOrganizationDao;
import io.renren.entity.YlHospitalEntity;
import io.renren.entity.YlOrganizationEntity;
import io.renren.service.YlHospitalService;
import io.renren.service.YlOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("ylHospitalService")
public class YlHospitalServiceImpl implements YlHospitalService {
	@Autowired
	private YlHospitalDao ylHospitalDao;
	
	@Override
	public void save(YlHospitalEntity hospital) {
		ylHospitalDao.save(hospital);
	}

	@Override
	public void update(YlHospitalEntity hospital) {
		ylHospitalDao.update(hospital);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		ylHospitalDao.deleteBatch(ids);
	}

	@Override
	public List<YlHospitalEntity> queryList(Map<String, Object> map) {
		return ylHospitalDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return ylHospitalDao.queryTotal(map);
	}

	@Override
	public YlHospitalEntity queryObject(Integer id) {
		return ylHospitalDao.queryObject(id);
	}
}

package io.renren.service.impl;

import io.renren.dao.QqLoginRecordDao;
import io.renren.entity.QqLoginRecordEntity;
import io.renren.service.QqLoginRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("qqLoginRecordService")
public class QqLoginRecordServiceImpl implements QqLoginRecordService {
	@Autowired
	private QqLoginRecordDao recordDao;
	
	@Override
	public void save(QqLoginRecordEntity record) {
		recordDao.save(record);
	}

	@Override
	public void update(QqLoginRecordEntity record) {
		recordDao.update(record);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		recordDao.deleteBatch(ids);
	}

	@Override
	public List<QqLoginRecordEntity> queryList(Map<String, Object> map) {
		return recordDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return recordDao.queryTotal(map);
	}

	@Override
	public QqLoginRecordEntity queryObject(Integer id) {
		return recordDao.queryObject(id);
	}
}

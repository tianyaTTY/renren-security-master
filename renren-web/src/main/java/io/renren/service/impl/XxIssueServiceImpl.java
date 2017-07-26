package io.renren.service.impl;

import io.renren.dao.XxIssueDao;
import io.renren.entity.XxIssueEntity;
import io.renren.service.XxIssueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("xxIssueService")
public class XxIssueServiceImpl implements XxIssueService {
	@Autowired
	private XxIssueDao xxIssueDao;
	
	@Override
	public void save(XxIssueEntity issue) {
		xxIssueDao.save(issue);
	}

	@Override
	public void update(XxIssueEntity issue) {
		xxIssueDao.update(issue);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		xxIssueDao.deleteBatch(ids);
	}

	@Override
	public List<XxIssueEntity> queryList(Map<String, Object> map) {
		return xxIssueDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return xxIssueDao.queryTotal(map);
	}

	@Override
	public XxIssueEntity queryObject(Integer id) {
		return xxIssueDao.queryObject(id);
	}
}

package io.renren.service.impl;

import io.renren.dao.QqMemberDao;
import io.renren.entity.QqMemberEntity;
import io.renren.service.QqMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("qqMemberService")
public class QqMemberServiceImpl implements QqMemberService {
	@Autowired
	private QqMemberDao memberDao;
	
	@Override
	public void save(QqMemberEntity member) {
		memberDao.save(member);
	}

	@Override
	public void update(QqMemberEntity member) {
		memberDao.update(member);
	}

	@Override
	public void deleteBatch(Integer[] ids) {
		memberDao.deleteBatch(ids);
	}

	@Override
	public List<QqMemberEntity> queryList(Map<String, Object> map) {
		return memberDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return memberDao.queryTotal(map);
	}

	@Override
	public QqMemberEntity queryObject(Integer id) {
		return memberDao.queryObject(id);
	}
}

package io.renren.service.impl;

import io.renren.dao.SysLocationDao;
import io.renren.dao.SysLogDao;
import io.renren.entity.SysLocationEntity;
import io.renren.entity.SysLogEntity;
import io.renren.service.SysLocationService;
import io.renren.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("sysLocationService")
public class SysLocationServiceImpl implements SysLocationService {
	@Autowired
	private SysLocationDao sysLocationDao;
	
	@Override
	public SysLocationEntity queryObject(Long id){
		return sysLocationDao.queryObject(id);
	}
	
	@Override
	public List<SysLocationEntity> queryList(Map<String, Object> map){
		return sysLocationDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysLocationDao.queryTotal(map);
	}
	
	@Override
	public void save(SysLocationEntity sysLog){
		sysLocationDao.save(sysLog);
	}
	
	@Override
	public void update(SysLocationEntity sysLog){
		sysLocationDao.update(sysLog);
	}
	
	@Override
	public void delete(Long id){
		sysLocationDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		sysLocationDao.deleteBatch(ids);
	}
	
}

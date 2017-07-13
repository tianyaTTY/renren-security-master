package io.renren.service;

import io.renren.entity.SysLocationEntity;
import io.renren.entity.SysLogEntity;

import java.util.List;
import java.util.Map;

/**
 * 系统日志
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-08 10:40:56
 */
public interface SysLocationService {

	SysLocationEntity queryObject(Long id);
	
	List<SysLocationEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SysLocationEntity sysLog);
	
	void update(SysLocationEntity sysLog);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}

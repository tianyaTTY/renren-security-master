package io.renren.service;

import io.renren.entity.QqLoginRecordEntity;
import java.util.List;
import java.util.Map;

/**
 * APP用户登录记录
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年8月1日 下午6:43:36
 */
public interface QqLoginRecordService {
	
	/**
	 * 保存APP用户登录记录
	 */
	public void save(QqLoginRecordEntity record);
	
	/**
	 * 更新APP用户登录记录
	 */
	public void update(QqLoginRecordEntity record);

	/**
	 * 删除APP用户登录记录
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<QqLoginRecordEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public QqLoginRecordEntity queryObject(Integer id);
	
}

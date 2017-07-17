package io.renren.service;

import io.renren.entity.XxLocationEntity;

import java.util.List;
import java.util.Map;

/**
 * 位置信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public interface XxLocationService {
	
	/**
	 * 保存位置信息
	 */
	public void save(XxLocationEntity location);
	
	/**
	 * 更新位置信息
	 */
	public void update(XxLocationEntity location);

	/**
	 * 删除位置信息
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<XxLocationEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public XxLocationEntity queryObject(Integer id);
	
}

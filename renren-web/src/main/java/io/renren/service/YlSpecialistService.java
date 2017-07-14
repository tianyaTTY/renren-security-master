package io.renren.service;

import io.renren.entity.YlSpecialistEntity;

import java.util.List;
import java.util.Map;

/**
 * 专家信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public interface YlSpecialistService {
	
	/**
	 * 保存专家信息
	 */
	public void save(YlSpecialistEntity specialist);
	
	/**
	 * 更新专家信息
	 */
	public void update(YlSpecialistEntity specialist);

	/**
	 * 删除专家信息
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<YlSpecialistEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public YlSpecialistEntity queryObject(Integer id);
	
}

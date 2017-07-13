package io.renren.service;

import io.renren.entity.YlDepartmentEntity;

import java.util.List;
import java.util.Map;

/**
 * 科室信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public interface YlDepartmentService {
	
	/**
	 * 保存科室信息
	 */
	public void save(YlDepartmentEntity department);
	
	/**
	 * 更新科室信息
	 */
	public void update(YlDepartmentEntity department);

	/**
	 * 删除科室信息
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<YlDepartmentEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public YlDepartmentEntity queryObject(Integer id);
	
}

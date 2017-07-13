package io.renren.service;

import io.renren.entity.YlOrganizationEntity;

import java.util.List;
import java.util.Map;

/**
 * 医疗组织信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public interface YlOrganizationService {
	
	/**
	 * 保存医疗组织信息
	 */
	public void save(YlOrganizationEntity org);
	
	/**
	 * 更新医疗组织信息
	 */
	public void update(YlOrganizationEntity org);

	/**
	 * 删除医疗组织信息
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<YlOrganizationEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public YlOrganizationEntity queryObject(Integer id);
	
}

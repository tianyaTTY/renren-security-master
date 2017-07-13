package io.renren.service;

import io.renren.entity.YlHospitalEntity;

import java.util.List;
import java.util.Map;

/**
 * 医院信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public interface YlHospitalService {
	
	/**
	 * 保存医院信息
	 */
	public void save(YlHospitalEntity hospital);
	
	/**
	 * 更新医院信息
	 */
	public void update(YlHospitalEntity hospital);

	/**
	 * 删除医院信息
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<YlHospitalEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public YlHospitalEntity queryObject(Integer id);
	
}

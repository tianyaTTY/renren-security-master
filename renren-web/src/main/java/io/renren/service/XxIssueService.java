package io.renren.service;

import io.renren.entity.XxIssueEntity;
import java.util.List;
import java.util.Map;

/**
 * 发布信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月26日 下午6:43:36
 */
public interface XxIssueService {
	
	/**
	 * 保存发布信息
	 */
	public void save(XxIssueEntity issue);
	
	/**
	 * 更新发布信息
	 */
	public void update(XxIssueEntity issue);

	/**
	 * 删除发布信息
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<XxIssueEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public XxIssueEntity queryObject(Integer id);
	
}

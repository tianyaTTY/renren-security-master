package io.renren.service;

import io.renren.entity.QqMemberEntity;

import java.util.List;
import java.util.Map;

/**
 * APP用户
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年8月1日 下午6:43:36
 */
public interface QqMemberService {
	
	/**
	 * 保存APP用户信息
	 */
	public void save(QqMemberEntity member);
	
	/**
	 * 更新APP用户信息
	 */
	public void update(QqMemberEntity member);

	/**
	 * 删除APP用户信息
	 */
	public void deleteBatch(Integer[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<QqMemberEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public QqMemberEntity queryObject(Integer id);
	
}

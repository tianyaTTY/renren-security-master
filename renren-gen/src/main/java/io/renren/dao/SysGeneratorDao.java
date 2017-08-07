package io.renren.dao;

import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月5日 下午6:43:36
 */
public interface SysGeneratorDao {
	
	List<Map<String, Object>> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	Map<String, String> queryTable(String tableName);
	
	List<Map<String, String>> queryColumns(String tableName);
}

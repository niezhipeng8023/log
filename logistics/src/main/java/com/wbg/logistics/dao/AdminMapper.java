package com.wbg.logistics.dao;

import com.wbg.logistics.entity.Admin;
import java.util.List;

public interface AdminMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer aId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated
     */
    int insert(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated
     */
    Admin selectByPrimaryKey(Integer aId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated
     */
    List<Admin> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Admin record);
}
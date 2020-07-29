package com.by.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author yc
 * @since 2020-07-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TTag implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer pid;

    private String name;

    private String icon;

    private Integer seqno;

    // 存储子节点的集合，初始化是为了避免指针异常
    @TableField(exist = false) //表示该属性不为数据库表字段，但又是必须使用的。
    private List<TTag> children = new ArrayList<>();
    // 控制节点是否默认为打开装，设置为true表示默认打开
    @TableField(exist = false)
    private Boolean open = true;


}

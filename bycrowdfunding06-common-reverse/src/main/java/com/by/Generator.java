package com.by;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class Generator  {


    public static void main(String[] args) {
        AutoGenerator mpg = new AutoGenerator();
        // =============================全局配置===============================
        mpg.setGlobalConfig(new GlobalConfig()
                // 覆盖输出到xxx目录
                .setFileOverride(true).setOutputDir(" D://idea-worksapces2//biyexiangmu//zhongchou//bycrowdfunding03-admin-component//src//main//java//")
//                .setFileOverride(true).setOutputDir("D://wly")
                // 主键生成策略 生成BaseResultMap
                .setIdType(IdType.AUTO).setBaseResultMap(true)
                // 指定作者
                .setAuthor("rj")
                // 设置Controller、Service、ServiceImpl、Dao、Mapper文件名称，%s是依据表名转换来的
                .setControllerName("%sController").setServiceName("%sService").setServiceImplName("%sServiceImpl").setMapperName("%sDao").setXmlName("%sMapper"));
        // ================================数据源配置============================
        mpg.setDataSource(new DataSourceConfig()
                // 用户名、密码、驱动、url
                .setUsername("root").setPassword("root")
                .setDbType(DbType.MYSQL).setDriverName("com.mysql.jdbc.Driver")
                .setUrl("jdbc:mysql://169.254.49.228:3306/project_crowd?useUnicode=true&characterEncoding=utf-8&useSSL=false")
        );
        // ===============================包名配置：父包.模块.controller===============================
        mpg.setPackageInfo(new PackageConfig()
                // 父包名 模块名   setModuleName("MybatisTest")=== 我们一般不写
                .setParent("com.by")//.setModuleName("MybatisTest")
                // 分层包名
                .setController("controller").setService("service").setServiceImpl("service.impl").setEntity("model").setMapper("com.by.mapper"));
        // =====================================策略配置==================================
        mpg.setStrategy(new StrategyConfig()
                //重点 === 设置需要映射的表
                .setInclude("t_menu")
                // 命名策略：实体的类名和属性名按下划线转驼峰 user_info -> userInfo
                .setNaming(NamingStrategy.underline_to_camel)
                //实体类自动添加 lombok注解
                .setEntityLombokModel(true)
                //开启乐观锁
                .setVersionFieldName("version")
                // controller生成@RestCcontroller
                .setRestControllerStyle(true));



        // 执行生成
        mpg.execute();

    }
}
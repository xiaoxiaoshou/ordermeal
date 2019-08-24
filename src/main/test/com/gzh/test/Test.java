package com.gzh.test;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) throws InvalidConfigurationException, InterruptedException, SQLException, IOException, XMLParserException {
        File file = new File("generator.xml") ;//配置文件

        List<String> warnings = new ArrayList<String>();
        ConfigurationParser cp = new ConfigurationParser(warnings);

        Configuration config = cp.parseConfiguration(file);


        DefaultShellCallback callBack = new DefaultShellCallback(true);

        //逆向工程的核心类
        MyBatisGenerator generator = new MyBatisGenerator(config, callBack,warnings  );
        generator.generate(null);
    }
}

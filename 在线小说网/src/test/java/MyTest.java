import com.xh.pojo.User;
import com.xh.utils.MD5Util;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @author:Teacher黄
 * @date:Created at 2019/07/03
 */
public class MyTest {

    @Test
    public void test01(){
        // 1. 加载配置文件
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");

        // 2. 通过上下文对象去获取bean
        User user = context.getBean("user", User.class);
        System.out.println(user);
       // Car car = context.getBean("car", Car.class);
        //System.out.println(car);
    }


    @Test
    public void test02() throws IOException {
        // 1. 加载资源

    }


    @Test
    public void test03(){
        System.out.println(MD5Util.MD55("111111"));
    }
}

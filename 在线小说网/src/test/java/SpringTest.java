
import com.xh.dao.BookMapper;
import com.xh.dao.DiscountMapper;
import com.xh.pojo.Book;
import com.xh.pojo.Discount;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author:Teacher黄
 * @date:Created at 2019/07/03
 */

@RunWith(SpringJUnit4ClassRunner.class)// 创建测试容器
@ContextConfiguration(locations = "classpath:spring-dao-config.xml")// 加载配置文件
public class SpringTest {

    @Autowired
    private DiscountMapper discountMapper;

    @Autowired
    private BookMapper bookMapper;

    @Test
    public void edit(){
        Discount discount = new Discount();
        discount.setActId(1);
        discount.setActName("限时全免");
        discount.setActStatus(2);
        Boolean update = discountMapper.update(discount);
        System.out.println(update);
    }

    @Test
    public void findyType(){
        List<Book> books = bookMapper.findByType(4);
        System.out.println(books);
    }

    @Test
    public void test01(){
    }


}

package com.xh.dao;

        import com.xh.pojo.History;

        import java.util.List;

public interface HistoryMapper {
    Boolean save(History history);

    //查询数据
    List<History> findList();

    //    search
    List<History> findByName(String bookName);

    //    delete
    Boolean batchUpdateStatus(String[] ids);
}

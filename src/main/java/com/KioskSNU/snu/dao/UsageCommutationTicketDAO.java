package com.KioskSNU.snu.dao;

import com.KioskSNU.snu.dto.AccountDTO;
import com.KioskSNU.snu.dto.UsageCommutationTicketDTO;
import com.KioskSNU.snu.service.UsageCommutationTicketService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UsageCommutationTicketDAO extends DAOTemplate implements UsageCommutationTicketService {
    public UsageCommutationTicketDAO(SqlSessionTemplate sqlSessionTemplate) {
        super(sqlSessionTemplate);
    }

    @Override
    public int insert(UsageCommutationTicketDTO usageCommutationTicketDTO) {
        return sqlSessionTemplate.insert("usageCommutationTicket.insert", usageCommutationTicketDTO);
    }

    @Override
    public int update(UsageCommutationTicketDTO usageCommutationTicketDTO) {
        return sqlSessionTemplate.update("usageCommutationTicket.update", usageCommutationTicketDTO);
    }

    @Override
    public int delete(UsageCommutationTicketDTO usageCommutationTicketDTO) {
        return sqlSessionTemplate.delete("usageCommutationTicket.delete", usageCommutationTicketDTO);
    }

    @Override
    public UsageCommutationTicketDTO getById(int id) {
        return sqlSessionTemplate.selectOne("usageCommutationTicket.getById", id);
    }

    @Override
    public List<UsageCommutationTicketDTO> getAll() {
        return sqlSessionTemplate.selectList("usageCommutationTicket.getAll");
    }

    @Override
    public List<UsageCommutationTicketDTO> getAllByAccount(AccountDTO accountDTO) {
        return sqlSessionTemplate.selectList("usageCommutationTicket.getAllByAccount", accountDTO);
    }
}

package com.KioskSNU.view.outside;

import com.KioskSNU.snu.dto.UsageLockerDTO;
import com.KioskSNU.snu.service.LockerService;
import com.KioskSNU.snu.service.UsageLockerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OutsideLockerController {
    private final LockerService lockerService;
    private final UsageLockerService usageLockerService;

    @Autowired
    public OutsideLockerController(
            LockerService lockerService,
            UsageLockerService usageLockerService
    ) {
        this.lockerService = lockerService;
        this.usageLockerService = usageLockerService;
    }

    @RequestMapping("/outside/locker")
    public ModelAndView process() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("outside/locker");

        Map<Integer, Integer> seatStatusMap = new HashMap<>();
        lockerService.getAll().forEach(locker -> {
            if (!locker.isUsable()) {
                seatStatusMap.put(locker.getLockerNumber(), -1);
                return;
            }

            List<UsageLockerDTO> usageLockerList = usageLockerService.getAllByLocker(locker);
            if (!usageLockerList.isEmpty()) {
                UsageLockerDTO latest = usageLockerList.get(0);
                if (latest.getEndDate().equals(LocalDate.now()) || latest.getEndDate().isAfter(LocalDate.now())) {
                    seatStatusMap.put(locker.getLockerNumber(), 0);
                    return;
                }
            }

            seatStatusMap.put(locker.getLockerNumber(), 1);
        });

        mav.addObject("seatStatusMap", seatStatusMap);
        return mav;
    }
}
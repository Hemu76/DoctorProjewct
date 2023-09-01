package doctorsAppointment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Control {
	Dao dc;

	@Autowired
	public Control(Dao dc) {
		this.dc = dc;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String data(Model mm) {
		return "login";
	}

	@RequestMapping(value = "/first1", method = RequestMethod.GET)
	public String data1(Model mm) {
		ArrayList<Doctors> al = dc.data();
		mm.addAttribute("dl", al);
		return "doctorsdata";
	}

	@RequestMapping(value = "/first2", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Doctors> data2(Respp pp, Model mm) {
		ArrayList<Doctors> al = dc.data();
		String res = pp.getDataa();
		System.out.println(res);
		for (int i = 0; i < al.size(); i++) {
			if (!res.equals(al.get(i).getDesignation())) {
				al.remove(i);
				i--;
			}
		}
		System.out.println(al.size());
		return al;
	}
}
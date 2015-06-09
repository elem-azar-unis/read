package java1.nine.action;

import java.awt.Font;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java1.nine.dao.BookManager;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.data.general.DefaultPieDataset;

import com.opensymphony.xwork2.ActionSupport;

public class JFreeChartAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private BookManager bookManager;
	private Map<String, Integer> map=new HashMap<String, Integer>();
	private String teamName;
	private int [] num=new int[10];
	private int totalScan;
	public int getTotalScan() {
		return totalScan;
	}


	public int[] getNum() {
		return num;
	}


	public String getTeamName() {
		return teamName;
	}

	public Map<String, Integer> getMap() {
		return map;
	}

	public void setMap(Map<String, Integer> map) {
		this.map = map;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}

	
	@Override
	public String execute() throws Exception {
		int num1 = bookManager.sacnNum("玄幻");
		map.put("玄幻", num1);
		String [] strings={"同人","游戏","玄幻","科幻","仙侠","武侠","竞技","漫画","历史","都市"};
		for (int i = 0; i < strings.length; i++) {
			num[i]=bookManager.sacnNum(strings[i]);
			totalScan+=num[i];
			map.put(strings[i],num[i]);
		}
		StandardChartTheme sct = new StandardChartTheme("CN");
		sct.setExtraLargeFont(new Font("宋体", Font.BOLD, 20));
		sct.setRegularFont(new Font("宋体", Font.BOLD, 20));
		sct.setLargeFont(new Font("宋体", Font.BOLD, 20));
		DefaultPieDataset dataset = new DefaultPieDataset();
		for (Entry<String, Integer> entry : map.entrySet()) {

			dataset.setValue(entry.getKey(), entry.getValue());
		}
		
		ChartFactory.setChartTheme(sct);
		JFreeChart jfreechart = ChartFactory.createPieChart3D("各种类型小说点击量比例图",
				dataset, true, true, true);
		ChartFrame frame = new ChartFrame("报表练习", jfreechart);
		FileOutputStream fos_jpg = null;
		try {
			fos_jpg = new FileOutputStream("E:\\workspace\\novelOnLine\\WebContent\\picture\\picture.jpg");
			// 第二个参数是设置图片清晰度，从0.1f到1.0f
			ChartUtilities
					.writeChartAsJPEG(fos_jpg, 1.0f, jfreechart, 600, 500);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fos_jpg.close();
			} catch (Exception e) {
			}
		}

		frame.pack();
		return SUCCESS;
	}
}
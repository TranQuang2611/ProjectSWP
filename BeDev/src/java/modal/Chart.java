/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author ACER
 */
public class Chart {
    private String name;
    private String[] xAxis;
    private double[] yAxisForEarning;
    private int[] yAxisForEnroll;

    public Chart(String name, String[] xAxis, double[] yAxis) {
        this.name = name;
        this.xAxis = xAxis;
        this.yAxisForEarning = yAxis;
    }

    public Chart(String name, String[] xAxis, int[] yAxisForEnroll) {
        this.name = name;
        this.xAxis = xAxis;
        this.yAxisForEnroll = yAxisForEnroll;
    }

    public double[] getyAxisForEarning() {
        return yAxisForEarning;
    }

    public void setyAxisForEarning(double[] yAxisForEarning) {
        this.yAxisForEarning = yAxisForEarning;
    }

    public int[] getyAxisForEnroll() {
        return yAxisForEnroll;
    }

    public void setyAxisForEnroll(int[] yAxisForEnroll) {
        this.yAxisForEnroll = yAxisForEnroll;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String[] getxAxis() {
        return xAxis;
    }

    public void setxAxis(String[] xAxis) {
        this.xAxis = xAxis;
    }

}

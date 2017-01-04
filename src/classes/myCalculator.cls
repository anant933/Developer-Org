public class myCalculator{
    public myCalculator(){
        add();
    }
    public static void add(){
        calculatorServices c= new calculatorServices();
        calculatorServices.CalculatorImplPort cPort= new calculatorServices.CalculatorImplPort();
        Double d=cPort.doAdd(5,6);
        System.debug('Sum of 5 and 6 is :'+d);
    }
}
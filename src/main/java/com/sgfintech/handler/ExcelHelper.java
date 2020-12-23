package com.sgfintech.handler;

/**
 * @author lucnguyen.hcmut@gmail.com
 */

import com.sgfintech.entity.Customer;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ExcelHelper {
    private List<String> fieldNames = new ArrayList<String>();
    private Workbook workbook = null;
    private String workbookName = "";

    public ExcelHelper(String workbookName) {
        this.workbookName = workbookName;
        initialize();
    }

    private void initialize() {
        setWorkbook(new HSSFWorkbook());
    }

    public void closeWorksheet() {
        FileOutputStream fileOut;
        try {
            fileOut = new FileOutputStream(getWorkbookName());
            getWorkbook().write(fileOut);
            fileOut.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private boolean setupFieldsForClass(Class clazz) throws Exception {
        Field[] fields = clazz.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            fieldNames.add(fields[i].getName());
        }
        return true;
    }

    private Sheet getSheetWithName(String name) {
        Sheet sheet = null;
        for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
            if (name.compareTo(workbook.getSheetName(i)) == 0) {
                sheet = workbook.getSheetAt(i);
                break;
            }
        }
        return sheet;
    }

    private void initializeForRead() throws InvalidFormatException, IOException {
        InputStream inp = new FileInputStream(getWorkbookName());
        workbook = WorkbookFactory.create(inp);
    }

    public List<Customer> parseDataFromExcel(String sheetName, String companyCode) throws Exception {
        initializeForRead();
        Sheet sheet = getSheetWithName(sheetName);
        List<Customer> lstCust = new ArrayList<>();
        Row row;
        for (int rowCount = 1; rowCount <= sheet.getLastRowNum(); rowCount++) {
            Customer c = new Customer();
            int count = 0;
            row = sheet.getRow(rowCount);
            c.setCompanyCode(companyCode);
            c.setCustomerPhone(row.getCell(count++).getStringCellValue());
            c.setCustomerName(row.getCell(count++).getStringCellValue());
            c.setCustomerEmail(row.getCell(count++).getStringCellValue());
            c.setCustomerCode(row.getCell(count++).getStringCellValue());
            c.setCustomerSalary(new Double(row.getCell(count++).getNumericCellValue()).longValue());
            c.setCustomerBank(row.getCell(count++).getStringCellValue());
            c.setCustomerId(row.getCell(count++).getStringCellValue());
            c.setCustomerAddress(row.getCell(count++).getStringCellValue());
            c.setCustomerAddressTemp(row.getCell(count++).getStringCellValue());
            c.setCustomerIdLocation(row.getCell(count++).getStringCellValue());
            c.setCustomerSocialInsurance(row.getCell(count++).getStringCellValue());
            c.setCustomerHealthInsurance(row.getCell(count++).getStringCellValue());
            c.setCustomerPosition(row.getCell(count++).getStringCellValue());
            c.setCustomerTax(row.getCell(count++).getStringCellValue());
            c.setCustomerContract(new Double(row.getCell(count++).getNumericCellValue()).longValue());
            c.setCustomerContractExpired(LocalDateTime.ofInstant(row.getCell(count++).getDateCellValue().toInstant(),
                    ZoneId.systemDefault()));
            c.setCustomerRelative(row.getCell(count++).getStringCellValue());
            c.setCustomerRelativePhone(row.getCell(count++).getStringCellValue());
            c.setCustomerBankAcc(row.getCell(count++).getStringCellValue());
            c.setCustomerBankName(row.getCell(count++).getStringCellValue());
            c.setCustomerIdDate(LocalDateTime.ofInstant(row.getCell(count++).getDateCellValue().toInstant(),
                    ZoneId.systemDefault()));
            lstCust.add(c);
        }
        return lstCust;
    }

    @SuppressWarnings("unchecked")
//    public <T> List<T> readData(String sheetName, String className) throws Exception {
//        initializeForRead();
//        Sheet sheet = getSheetWithName(sheetName);
//        Class clazz = Class.forName(className);
//        setupFieldsForClass(clazz);
//        List<T> result = new ArrayList<T>();
//        Row row;
//        for (int rowCount = 1; rowCount <= sheet.getLastRowNum(); rowCount++) {
//            T one = (T) clazz.newInstance();
//            row = sheet.getRow(rowCount);
//            int colCount = 0;
//            result.add(one);
//            for (int j = 0; j < fieldNames.size(); j++) {
//                Method method = mappingDataToObject(row,fieldNames.get(j),clazz);
//
//            }
//            for (Cell cell : row) {
//
//
//                String fieldName = fieldNames.get(colCount++);
//                if (fieldName.equalsIgnoreCase("serialVersionUID")) {
//                    continue;
//                }
//                if (fieldName.equalsIgnoreCase("id")) {
//                    continue;
//                }
//                Method method = constructMethod(clazz, fieldName);
//                CellType cellType = cell.getCellTypeEnum();
//                if (cellType == CellType.STRING) {
//                    String value = cell.getStringCellValue();
//                    Object[] values = new Object[1];
//                    values[0] = value;
//                    method.invoke(one, values);
//                } else if (cellType == CellType.NUMERIC) {
//                    Double num = cell.getNumericCellValue();
//                    Class returnType = getGetterReturnClass(clazz, fieldName);
//                    if (returnType == int.class || returnType == Integer.class) {
//                        method.invoke(one, num.intValue());
//                    } else if (returnType == double.class || returnType == Double.class) {
//                        method.invoke(one, num);
//                    } else if (returnType == float.class || returnType == Float.class) {
//                        method.invoke(one, num.floatValue());
//                    } else if (returnType == long.class || returnType == Long.class) {
//                        method.invoke(one, num.longValue());
//                    } else if (returnType == Date.class) {
//                        Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
//                        method.invoke(one, date);
//                    }
//                } else if (cellType == CellType.BOOLEAN) {
//                    boolean num = cell.getBooleanCellValue();
//                    Object[] values = new Object[1];
//                    values[0] = num;
//                    method.invoke(one, values);
//                }
//            }
//        }
//        return result;
//    }

    private void mappingDataToObject(Row row, String fieldName, Class clazz) {
        Method method = null;
        String value = "";
        switch (fieldName) {
            case "serialVersionUID":
            case "id":
                break;
            case "companyCode":
                value = "";
                break;
            case "customerPhone":
                break;
            case "customerName":
                break;
            case "customerEmail":
                break;
            case "customerCode":
                break;
            case "customerSalary":
                break;
            case "customerBank":
                break;
            case "customerBankAcc":
                break;
            case "customerBankName":
                break;
            case "customerId":
                break;
            case "customerIdDate":
                break;
            case "customerAddress":
                break;
            case "customerAddressTemp":
                break;
            case "customerIdLocation":
                break;
            case "customerSocialInsurance":
                break;
            case "customerHealthInsurance":
                break;
            case "customerPosition":
                break;
            case "customerTax":
                break;
            case "customerContract":
                break;
            case "customerContractExpired":
                break;
            case "customerRelative":
                break;
            case "customerRelativePhone":
                break;
            case "customerImageFront":
                break;
            case "customerImageBack":
                break;
            case "status":
                break;
            case "createdDate":
                break;
            case "updatedDate":
                break;
            case "loginedDate":
                break;
            default:
                break;
        }
    }

    private Class getGetterReturnClass(Class clazz, String fieldName) {
        String methodName = "get" + capitalize(fieldName);
        String methodIsName = "is" + capitalize(fieldName);
        Class returnType = null;
        for (Method method : clazz.getMethods()) {
            if (method.getName().equals(methodName) || method.getName().equals(methodIsName)) {
                returnType = method.getReturnType();
                break;
            }
        }
        return returnType;
    }

    @SuppressWarnings("unchecked")
    private Method constructMethod(Class clazz, String fieldName) throws SecurityException, NoSuchMethodException {
        Class fieldClass = getGetterReturnClass(clazz, fieldName);
        return clazz.getMethod("set" + capitalize(fieldName), fieldClass);
    }

    public <T> void writeData(List<T> data) throws Exception {
        try {
            Sheet sheet = getWorkbook().createSheet(data.get(0).getClass().getName());
            setupFieldsForClass(data.get(0).getClass());
            int rowCount = 0;
            int columnCount = 0;
            Row row = sheet.createRow(rowCount++);
            for (String fieldName : fieldNames) {
                Cell cel = row.createCell(columnCount++);
                cel.setCellValue(fieldName);
            }
            Class<? extends Object> classz = data.get(0).getClass();
            for (T t : data) {
                row = sheet.createRow(rowCount++);
                columnCount = 0;
                for (String fieldName : fieldNames) {
                    Cell cel = row.createCell(columnCount);
                    Method method = classz.getMethod("get" + capitalize(fieldName));
                    Object value = method.invoke(t, (Object[]) null);
                    if (value != null) {
                        if (value instanceof String) {
                            cel.setCellValue((String) value);
                        } else if (value instanceof Long) {
                            cel.setCellValue((Long) value);
                        } else if (value instanceof Integer) {
                            cel.setCellValue((Integer) value);
                        } else if (value instanceof Double) {
                            cel.setCellValue((Double) value);
                        } else if (value instanceof Date) {
                            cel.setCellValue((Date) value);
                            CellStyle styleDate = workbook.createCellStyle();
                            DataFormat dataFormatDate = workbook.createDataFormat();
                            styleDate.setDataFormat(dataFormatDate.getFormat("m/d/yy"));
                            cel.setCellStyle(styleDate);
                        } else if (value instanceof Boolean) {
                            cel.setCellValue((Boolean) value);
                        }
                    }
                    columnCount++;
                }
            }

            // Autofit
            for (int i = 0; i < fieldNames.size(); i++)
                sheet.autoSizeColumn(i);

            FileOutputStream out = new FileOutputStream(new File(workbookName));
            workbook.write(out);
            out.close();
            workbook.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public String capitalize(String string) {
        String capital = string.substring(0, 1).toUpperCase();
        return capital + string.substring(1);
    }

    public String getWorkbookName() {
        return workbookName;
    }

    public void setWorkbookName(String workbookName) {
        this.workbookName = workbookName;
    }

    void setWorkbook(Workbook workbook) {
        this.workbook = workbook;
    }

    public Workbook getWorkbook() {
        return workbook;
    }
}

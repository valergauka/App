import React from 'react';
import { PDFViewer, Document, Page, Text, View, StyleSheet } from '@react-pdf/renderer';
import { Font } from '@react-pdf/renderer';

Font.register({ family: 'DejaVuSans', src: './font/DejaVuSans.ttf', encoding: 'Identity-H' });

const styles = StyleSheet.create({
  page: {
    fontFamily: 'DejaVuSans',
    fontSize: 12,
    paddingTop: 30,
    paddingLeft: 60,
    paddingRight: 60,
    paddingBottom: 30,
  },
  title: {
    fontSize: 24,
    textAlign: 'center',
    marginBottom: 20,
  },
  categoryTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  text: {
    fontSize: 14,
  },
  approvText: {
    fontSize: 12,
    marginTop: 5,
    fontStyle: 'italic',
  },
  guarantorChange: {
    marginBottom: 10,
  },
});

const PDFGenerator = (props) => {
  try {
    if (!props.data || props.data.length === 0) {
      return (
        <PDFViewer width="100%" height={600}>
          <Document>
            <Page style={styles.page}>
              <Text>No data available for PDF generation.</Text>
            </Page>
          </Document>
        </PDFViewer>
      );
    }

    const sortedData = props.data.sort((a, b) => a.nameOp.localeCompare(b.nameOp));
    const categories = [...new Set(sortedData.map((el) => el.category.id))];

    return (
      <PDFViewer width="100%" height={600}>
        <Document>
          <Page style={styles.page}>
            <View>
              {sortedData.map((el) => (
                <View key={el.id}>
                  <Text style={styles.text}>
                    {`ОП: ${el.nameOp}\nСпеціальність: ${el.speciality}\nРівень: ${el.educLevel}\nГарант: ${el.guarantor}\nДата подання: ${el.date}\n`}
                    <View style={styles.guarantorChange}>
                      <Text style={styles.categoryTitle}>
                        {`${el.category.title}\n`}
                      </Text>
                      <Text style={styles.text}>
                        {`Затвердження: \n`}
                        <Text>
                          {`Протокол засідання Комісії: \n№${el.approve[0]?.committeMNNumber || ' '}  `}
                          {`Дата: ${el.approve[0]?.committeMNDate || ' '}\n`}
                          {`Протокол засідання Вченої ради:\n №${el.approve[0]?.committeSCNumber || ' '}  `}
                          {`Дата: ${el.approve[0]?.committeSCDate || ' '}\n`}
                          {`Наказ про утвердження: \n№${el.approve[0]?.orderNumber || ' '}  `}
                          {`Дата: ${el.approve[0]?.orderDate || ' '}\n`}
                          {`Ухвала комісії: ${el.approve[0]?.resolution || ' '}\n\n`}
                        </Text>
                      </Text>
                    </View>
                  </Text>
                </View>
              ))}
            </View>
          </Page>
        </Document>
      </PDFViewer>
    );
  } catch (error) {
    console.error('Error generating PDF:', error);
    return (
      <PDFViewer width="100%" height={600}>
        <Document>
          <Page style={styles.page}>
            <Text>Error generating PDF. Please check the console for details.</Text>
          </Page>
        </Document>
      </PDFViewer>
    );
  }
};

export default PDFGenerator;

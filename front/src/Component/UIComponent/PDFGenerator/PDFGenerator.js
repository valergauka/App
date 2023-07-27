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
});

const PDFGenerator = ({ data }) => {
  const categories = [...new Set(data.map((el) => el.category))];

  return (
    <PDFViewer width="100%" height={600}>
      <Document>
        <Page style={styles.page}>
          <Text style={styles.title}>Звіт</Text>

          {categories.map((category, categoryIndex) => (
            <View key={category}>
              {categoryIndex > 0 && <View style={{ marginTop: 10 }} />} {/* Доданий пробіл */}
              <Text style={styles.categoryTitle}>{category}</Text>
              {data
                .filter((el) => el.category === category)
                .map((el, index) => (
                  <View key={el.id}>
                    <Text style={styles.text}>
                      {`${index + 1}. \nРівень: ${el.educLevel.replace(/[\t\n]/g, '')} \n Спеціальність: ${el.speciality.replace(/[\t\n]/g, '')} \n ОП: ${el.nameOp.replace(/[\t\n]/g, '')} \n Гарант: ${el.guaranty.replace(/[\t\n]/g, '')}  \n Дата подання:${el.date.replace(/[\t\n]/g, '')}`}
                    </Text>
                  </View>
                ))}
            </View>
          ))}
        </Page>
      </Document>
    </PDFViewer>
  );
};

export default PDFGenerator;

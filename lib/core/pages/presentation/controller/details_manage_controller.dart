import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:weboapp_pocket/constants/color.dart';

class DetailsManageController extends GetxController {
  Future<void> generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Text('Payment Details Report',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
            ),
            pw.Paragraph(
              text:
                  'This report provides a detailed overview of employee payments for the first half of the year. '
                  'It includes monthly salary information, any pay cuts, and overtime payments.',
              style: pw.TextStyle(fontSize: 14),
            ),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: PdfColors.grey300),
                  children: [
                    pw.Padding(
                      padding: pw.EdgeInsets.all(5),
                      child: pw.Text('Month',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.all(5),
                      child: pw.Text('Salary',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.all(5),
                      child: pw.Text('Cut_Pay',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.all(5),
                      child: pw.Text('OverTime pay',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('January')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('37000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('Null')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('0')),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('February')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('37000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('Null')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('0')),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('March')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('35000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('2000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('0')),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('April')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('36000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('1000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('0')),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('May')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('40000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('Null')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('3000')),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('June')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('56000')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('Null')),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5), child: pw.Text('9000')),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Paragraph(
              text:
                  'Note: "Null" indicates that no pay cut or overtime was applicable for that month.',
              style: pw.TextStyle(fontSize: 12, fontStyle: pw.FontStyle.italic),
            ),
            pw.SizedBox(height: 20),
            pw.Paragraph(
              text:
                  'This report was generated on ${DateFormat('MMMM d, yyyy').format(DateTime.now())}. '
                  'If you have any questions or concerns regarding this report, please contact the HR department.',
              style: pw.TextStyle(fontSize: 12),
            ),
          ];
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/payment_details_report.pdf");
    await file.writeAsBytes(await pdf.save());

    OpenFile.open(file.path);
  }
}

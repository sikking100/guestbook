import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/controller/adminController.dart';
import 'package:intl/intl.dart';

class PageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Administrator"),
        actions: [IconButton(icon: Icon(Icons.exit_to_app), onPressed: controller.exit)],
      ),
      drawerEnableOpenDragGesture: true,
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Center(
              child: Text("Data tamu hari ini.", style: Get.textTheme.headline3),
            ),
            Obx(
              () {
                if (controller.listData.length == 0) return Center(child: Text("Belum ada data."));
                if (controller.listData.length > 0) {
                  final List<TableRow> list = List<TableRow>.empty(growable: true);
                  list.insert(
                    0,
                    TableRow(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("No")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Tanggal")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Nama")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("No. Telp")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Email")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Keperluan")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Status")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Kesan")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Status Kunjungan")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Waktu Masuk")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Waktu Keluar")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text("Aksi")),
                      ],
                    ),
                  );
                  for (var i = 0; i < controller.listData.length; i++) {
                    list.add(
                      TableRow(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text((i + 1).toString())),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              DateFormat("d MMMM yyyy").format(
                                controller.listData[i].timestamp!.toDate(),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(controller.listData[i].nama!)),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(controller.listData[i].telp!)),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(controller.listData[i].email!)),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(controller.listData[i].keperluan!)),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text(controller.listData[i].status, style: TextStyle(color: controller.listData[i].color))),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(controller.listData[i].kesan!)),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text(controller.listData[i].statusLoc, style: TextStyle(color: controller.listData[i].colorLoc))),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text(DateFormat("HH:mm:ss").format(controller.listData[i].masuk!.toDate()))),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                                controller.listData[i].keluar != null ? DateFormat("HH:mm:ss").format(controller.listData[i].keluar!.toDate()) : ""),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              controller.listData[i].locStatus! == true
                                  ? ElevatedButton(
                                      onPressed: () => controller.deleteId(controller.listData[i].ref!.id),
                                      child: Text("Delete"),
                                      style: ElevatedButton.styleFrom(primary: Colors.red))
                                  : Container(),
                              controller.listData[i].approve! == false
                                  ? ElevatedButton(onPressed: () => controller.approve(controller.listData[i].ref!.id), child: Text("Approve"))
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  return Table(
                    columnWidths: {0: FixedColumnWidth(30)},
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: list,
                    border: TableBorder.all(),
                  );
                  // return DataTable(
                  //   columns: [
                  //     DataColumn(label: Text("Tanggal")),
                  //     DataColumn(label: Text("Nama")),
                  //     DataColumn(label: Text("No. Telp")),
                  //     DataColumn(label: Text("Email")),
                  //     DataColumn(label: Text("Keperluan")),
                  //     DataColumn(label: Text("Status")),
                  //     DataColumn(label: Text("Kesan")),
                  //     DataColumn(label: Text("Status Kunjungan")),
                  //     DataColumn(label: Text("Waktu Masuk")),
                  //     DataColumn(label: Text("Waktu Keluar")),
                  //     DataColumn(label: Text("Aksi")),
                  //   ],
                  //   rows: controller.listData
                  //       .map(
                  //         (e) => DataRow(
                  //           cells: [
                  //             DataCell(Text(e.nama!)),
                  //             DataCell(Text(e.telp!)),
                  //             DataCell(Text(e.email!)),
                  //             DataCell(Text(e.keperluan!)),
                  //             DataCell(Text(e.status, style: TextStyle(color: e.color))),
                  //             DataCell(Text(e.kesan!)),
                  //             DataCell(Text(e.statusLoc, style: TextStyle(color: e.colorLoc))),
                  //             DataCell(
                  //               ButtonBar(
                  //                 alignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   !e.locStatus! == true
                  //                       ? ElevatedButton(
                  //                           onPressed: () => controller.deleteId(e.ref!.id),
                  //                           child: Text("Delete"),
                  //                           style: ElevatedButton.styleFrom(primary: Colors.red))
                  //                       : Container(),
                  //                   !e.approve! == true
                  //                       ? ElevatedButton(onPressed: () => controller.approve(e.ref!.id), child: Text("Approve"))
                  //                       : Container(),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //       .toList(),
                  // );
                }
                return LinearProgressIndicator();
              },
            )
            // FutureBuilder<List<ModelTamu>>(
            //   future: controller.getData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) return Center(child: Text(snapshot.error.toString()));
            //     if (snapshot.hasData) {
            //       return DataTable(
            //         columns: [
            //           DataColumn(label: Text("Nama")),
            //           DataColumn(label: Text("No. Telp")),
            //           DataColumn(label: Text("Email")),
            //           DataColumn(label: Text("Keperluan")),
            //           DataColumn(label: Text("Status")),
            //           DataColumn(label: Text("Aksi")),
            //         ],
            //         rows: snapshot.data!
            //             .map((e) => DataRow(cells: [
            //                   DataCell(Text(e.nama!)),
            //                   DataCell(Text(e.telp!)),
            //                   DataCell(Text(e.email!)),
            //                   DataCell(Text(e.keperluan!)),
            //                   DataCell(Text(e.approve!.toString())),
            //                   DataCell(Text(e.nama!)),
            //                 ]))
            //             .toList(),
            //       );
            //     }
            //     return LinearProgressIndicator();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

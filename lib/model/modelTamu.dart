import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModelTamu {
  DocumentReference? ref;
  String? nama;
  String? telp;
  String? email;
  String? keperluan;
  String? kesan;
  bool? approve;
  bool? locStatus;
  String get status {
    if (approve != null && approve == true) {
      return "Terapprove";
    }
    return "Belum di approve";
  }

  Color get color {
    if (approve != null && approve == true) {
      return Colors.green;
    }
    return Colors.red;
  }

  String get statusLoc {
    if (locStatus != null && locStatus == true) {
      return "Sudah pulang";
    }
    return "Belum pulang";
  }

  Color get colorLoc {
    if (locStatus != null && locStatus == true) {
      return Colors.green;
    }
    return Colors.red;
  }

  Timestamp? masuk;
  Timestamp? keluar;
  Timestamp? timestamp;

  ModelTamu(
      {this.ref,
      this.nama,
      this.telp,
      this.email,
      this.keperluan,
      this.approve,
      this.kesan,
      this.locStatus,
      this.masuk,
      this.keluar,
      this.timestamp});

  factory ModelTamu.fromFirestore(DocumentSnapshot doc) => ModelTamu(
        ref: doc.reference,
        nama: doc.get("nama"),
        telp: doc.get("telp"),
        email: doc.get("email"),
        keperluan: doc.get("keperluan"),
        approve: doc.get("approve"),
        kesan: doc.data()!["kesan"] == null ? null : doc.get("kesan"),
        locStatus: doc.data()!["locStatus"] == null ? null : doc.get("locStatus"),
        masuk: doc.data()!["masuk"] == null ? null : doc.get("masuk"),
        keluar: doc.data()!["keluar"] == null ? null : doc.get("keluar"),
        timestamp: doc.get("timestamp"),
      );
}

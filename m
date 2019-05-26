Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD02B411
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE3289B0D;
	Mon, 27 May 2019 12:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2259 seconds by postgrey-1.36 at gabe;
 Sun, 26 May 2019 12:29:42 UTC
Received: from www17.your-server.de (www17.your-server.de [213.133.104.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682BC88C07
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 12:29:42 +0000 (UTC)
Received: from [88.198.220.132] (helo=sslproxy03.your-server.de)
 by www17.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <thomas@m3y3r.de>)
 id 1hUrh3-00032r-9b; Sun, 26 May 2019 13:52:01 +0200
Received: from [2a02:908:4c22:ec00:915f:2518:d2f6:b586]
 (helo=maria.localdomain) by sslproxy03.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <thomas@m3y3r.de>)
 id 1hUrh1-0008TO-VQ; Sun, 26 May 2019 13:52:01 +0200
Received: by maria.localdomain (sSMTP sendmail emulation);
 Sun, 26 May 2019 13:51:59 +0200
From: "Thomas Meyer" <thomas@m3y3r.de>
Date: Sun, 26 May 2019 13:51:59 +0200
Message-Id: <E1hUrh1-0008TO-VQ@sslproxy03.your-server.de>
X-Authenticated-Sender: thomas@m3y3r.de
X-Virus-Scanned: Clear (ClamAV 0.100.3/25461/Sun May 26 09:57:08 2019)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbSB0aG9tYXNAbTN5M3IuZGUgU3VuIE1heSAyNiAxMzo0OTowNCAyMDE5ClN1YmplY3Q6IFtQ
QVRDSF0gZHJtL29tYXA6IE1ha2Ugc3VyZSBkZXZpY2VfaWQgdGFibGVzIGFyZSBOVUxMIHRlcm1p
bmF0ZWQKVG86IHRvbWkudmFsa2VpbmVuQHRpLmNvbSwgYWlybGllZEBsaW51eC5pZSwgZGFuaWVs
QGZmd2xsLmNoLAogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZwpDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9IlVURi04
IgpNaW1lLVZlcnNpb246IDEuMApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0ClgtUGF0
Y2g6IENvY2NpClgtTWFpbGVyOiBEaWZmU3BsaXQKTWVzc2FnZS1JRDogPDE1NTg4NzEzNjQ2MTEt
MjQ5NDI1MDc2LTEtZGlmZnNwbGl0LXRob21hc0BtM3kzci5kZT4KUmVmZXJlbmNlczogPDE1NTg4
NzEzNjQ2MDUtMTAyNjQ0ODY5My0wLWRpZmZzcGxpdC10aG9tYXNAbTN5M3IuZGU+CkluLVJlcGx5
LVRvOiA8MTU1ODg3MTM2NDYwNS0xMDI2NDQ4NjkzLTAtZGlmZnNwbGl0LXRob21hc0BtM3kzci5k
ZT4KWC1TZXJpYWwtTm86IDEKCk1ha2Ugc3VyZSAob2YvaTJjL3BsYXRmb3JtKV9kZXZpY2VfaWQg
dGFibGVzIGFyZSBOVUxMIHRlcm1pbmF0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgTWV5ZXIg
PHRob21hc0BtM3kzci5kZT4KLS0tCgpkaWZmIC11IC1wIGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL29tYXBkc3MtYm9vdC1pbml0LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
b21hcGRzcy1ib290LWluaXQuYwotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21h
cGRzcy1ib290LWluaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRz
cy1ib290LWluaXQuYwpAQCAtMTk4LDYgKzE5OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG9tYXBkc3MKIAl7IC5jb21wYXRpYmxlID0gInRvcHBvbHksdGQwMjh0dGVjMSIg
fSwKIAl7IC5jb21wYXRpYmxlID0gInRwbyx0ZDAyOHR0ZWMxIiB9LAogCXsgLmNvbXBhdGlibGUg
PSAidHBvLHRkMDQzbXRlYTEiIH0sCisJe30sCiB9OwogCiBzdGF0aWMgaW50IF9faW5pdCBvbWFw
ZHNzX2Jvb3RfaW5pdCh2b2lkKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

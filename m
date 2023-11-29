Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C232E7FCCE8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 03:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65E610E5E6;
	Wed, 29 Nov 2023 02:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F6C10E5E6;
 Wed, 29 Nov 2023 02:32:25 +0000 (UTC)
X-UUID: ae9a38e80c5a4d8c8348b3be7a1253f7-20231129
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:5948b2d2-88b2-414e-b5b3-a4b420605a2c, IP:25,
 URL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,
 ACTION:release,TS:-45
X-CID-INFO: VERSION:1.1.33, REQID:5948b2d2-88b2-414e-b5b3-a4b420605a2c, IP:25,
 UR
 L:0,TC:0,Content:-25,EDM:-30,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
 TION:release,TS:-45
X-CID-META: VersionHash:364b77b, CLOUDID:0ab5ed95-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:231129103218F9XVODIW,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
 02,TC:0,Content:0,EDM:2,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: ae9a38e80c5a4d8c8348b3be7a1253f7-20231129
Received: from node4.com.cn [(39.156.73.12)] by mailgw
 (envelope-from <heminhong@kylinos.cn>) (Generic MTA)
 with ESMTP id 1963753895; Wed, 29 Nov 2023 10:32:18 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
 by node4.com.cn (NSMail) with SMTP id D9AC516001CC8;
 Wed, 29 Nov 2023 10:32:17 +0800 (CST)
Received: by node4.com.cn (NSMail, from userid 0)
 id CCD3516001CC8; Wed, 29 Nov 2023 10:32:17 +0800 (CST)
From: =?UTF-8?B?5L2V5pWP57qi?= <heminhong@kylinos.cn>
Subject: =?UTF-8?B?RnJpZW5kbHkgcGluZy4gSSB0aGluayB0aGlzIHBhdGNoIHdhcyBmb3Jnb3R0ZW4uLy/lm57lpI06IFtQQVRDSF0gZHJtL3F4bDogcmVtb3ZlIHVudXNlZCBkZWNsYXJhdGlvbg==?=
To: =?UTF-8?B?5L2V5pWP57qi?= <heminhong@kylinos.cn>,
 =?UTF-8?B?YWlybGllZA==?= <airlied@redhat.com>,
 =?UTF-8?B?a3JheGVs?= <kraxel@redhat.com>,
 =?UTF-8?B?bWFhcnRlbi5sYW5raG9yc3Q=?= <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?bXJpcGFyZA==?= <mripard@kernel.org>,
 =?UTF-8?B?dHppbW1lcm1hbm4=?= <tzimmermann@suse.de>,
 =?UTF-8?B?YWlybGllZA==?= <airlied@gmail.com>,
 =?UTF-8?B?ZGFuaWVs?= <daniel@ffwll.ch>,
Date: Wed, 29 Nov 2023 10:32:17 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <1290mcwo8vf-129368jicj0@nsmail7.0.0--kylin--1>
References: 20231110055031.57360-1-heminhong@kylinos.cn
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Wed, 29 Nov 2023 10:32:17 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-1618ncacani-1619xa3rchb
X-ns-mid: webmail-6566a2b1-15tnkbev
X-ope-from: <heminhong@kylinos.cn>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?B?c3BpY2UtZGV2ZWw=?= <spice-devel@lists.freedesktop.org>,
 =?UTF-8?B?5L2V5pWP57qi?= <heminhong@kylinos.cn>,
 =?UTF-8?B?dmlydHVhbGl6YXRpb24=?= <virtualization@lists.linux.dev>,
 =?UTF-8?B?ZHJpLWRldmVs?= <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This message is in MIME format.

--nsmail-1618ncacani-1619xa3rchb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHByZSBjbGFzcz0ianNfbWVzc2FnZV9wbGFpbiBuZy1iaW5kaW5nIiBzdHls
ZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IGZvbnQt
ZmFtaWx5OiBpbmhlcml0OyBmb250LXNpemU6IDE0cHg7IHdoaXRlLXNwYWNl
OiBwcmUtd3JhcDsgd29yZC1icmVhazogbm9ybWFsOyBiYWNrZ3JvdW5kLWNv
bG9yOiAjZmZmZmZmOyI+RnJpZW5kbHkgcGluZy4gSSB0aGluayB0aGlzIHBh
dGNoIHdhcyBmb3Jnb3R0ZW4uPC9wcmU+CjxwPjxicj4tLS0tPC9wPgo8ZGl2
IGlkPSJjczJjX21haWxfc2lnYXR1cmUiPjwvZGl2Pgo8cD4mbmJzcDs8L3A+
CjxkaXYgaWQ9InJlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6IDAuNWVtOyBwYWRk
aW5nLWxlZnQ6IDAuNWVtOyBib3JkZXItbGVmdDogMXB4IHNvbGlkIGdyZWVu
OyI+PGJyPjxicj48YnI+CjxkaXYgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6
ICNmNWY3ZmE7Ij48c3Ryb25nPuS4u+OAgOmimO+8mjwvc3Ryb25nPjxzcGFu
IGlkPSJzdWJqZWN0Ij5bUEFUQ0hdIGRybS9xeGw6IHJlbW92ZSB1bnVzZWQg
ZGVjbGFyYXRpb248L3NwYW4+IDxicj48c3Ryb25nPuaXpeOAgOacn++8mjwv
c3Ryb25nPjxzcGFuIGlkPSJkYXRlIj4yMDIzLTExLTEwIDEzOjUwPC9zcGFu
PiA8YnI+PHN0cm9uZz7lj5Hku7bkurrvvJo8L3N0cm9uZz48c3BhbiBpZD0i
ZnJvbSI+5L2V5pWP57qiPC9zcGFuPiA8YnI+PHN0cm9uZz7mlLbku7bkurrv
vJo8L3N0cm9uZz48c3BhbiBpZD0idG8iIHN0eWxlPSJ3b3JkLWJyZWFrOiBi
cmVhay1hbGw7Ij5haXJsaWVkO2tyYXhlbDttYWFydGVuLmxhbmtob3JzdDtt
cmlwYXJkO3R6aW1tZXJtYW5uO2FpcmxpZWQ7ZGFuaWVsOzwvc3Bhbj48L2Rp
dj4KPGJyPgo8ZGl2IGlkPSJjb250ZW50Ij4KPGRpdiBjbGFzcz0idmlld2Vy
X3BhcnQiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7Ij4KPGRpdj5Tb21l
IGZ1bmN0aW9ucyBhcmUgbmV2ZXIgdXNlZCBieSB0aGUgZHJpdmVyLDxicj5y
ZW1vdmluZyB0aGUgZnVuY3Rpb25zIGRlY2xhcmF0aW9uLCBpdCBjYW4gYmUg
cmVkdWNpbmcgcHJvZ3JhbSBzaXplLDxicj5hbmQgaW1wcm92aW5nIGNvZGUg
cmVhZGFiaWxpdHkgYW5kIG1haW50YWluYWJpbGl0eS48YnI+PGJyPlNpZ25l
ZC1vZmYtYnk6IGhlbWluaG9uZyA8YnI+LS0tPGJyPmRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2Rydi5oIHwgNyAtLS0tLS0tPGJyPjEgZmlsZSBjaGFuZ2Vk
LCA3IGRlbGV0aW9ucygtKTxicj48YnI+ZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfZHJ2Lmg8YnI+aW5kZXggMzA3YTg5MGZkZTEzLi4zMjA2OWFjZDkzZjgg
MTAwNjQ0PGJyPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5o
PGJyPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oPGJyPkBA
IC0xMTksNyArMTE5LDYgQEAgc3RydWN0IHF4bF9vdXRwdXQgezxicj48YnI+
I2RlZmluZSB0b19xeGxfY3J0Yyh4KSBjb250YWluZXJfb2YoeCwgc3RydWN0
IHF4bF9jcnRjLCBiYXNlKTxicj4jZGVmaW5lIGRybV9jb25uZWN0b3JfdG9f
cXhsX291dHB1dCh4KSBjb250YWluZXJfb2YoeCwgc3RydWN0IHF4bF9vdXRw
dXQsIGJhc2UpPGJyPi0jZGVmaW5lIGRybV9lbmNvZGVyX3RvX3F4bF9vdXRw
dXQoeCkgY29udGFpbmVyX29mKHgsIHN0cnVjdCBxeGxfb3V0cHV0LCBlbmMp
PGJyPjxicj5zdHJ1Y3QgcXhsX21tYW4gezxicj5zdHJ1Y3QgdHRtX2Rldmlj
ZSBiZGV2Ozxicj5AQCAtMjU2LDggKzI1NSw2IEBAIHN0cnVjdCBxeGxfZGV2
aWNlIHs8YnI+PGJyPiNkZWZpbmUgdG9fcXhsKGRldikgY29udGFpbmVyX29m
KGRldiwgc3RydWN0IHF4bF9kZXZpY2UsIGRkZXYpPGJyPjxicj4taW50IHF4
bF9kZWJ1Z2ZzX2ZlbmNlX2luaXQoc3RydWN0IHF4bF9kZXZpY2UgKnJkZXYp
Ozxicj4tPGJyPmludCBxeGxfZGV2aWNlX2luaXQoc3RydWN0IHF4bF9kZXZp
Y2UgKnFkZXYsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KTs8YnI+dm9pZCBxeGxf
ZGV2aWNlX2Zpbmkoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYpOzxicj48YnI+
QEAgLTM0NCw4ICszNDEsNiBAQCBxeGxfaW1hZ2VfYWxsb2Nfb2JqZWN0cyhz
dHJ1Y3QgcXhsX2RldmljZSAqcWRldiw8YnI+aW50IGhlaWdodCwgaW50IHN0
cmlkZSk7PGJyPnZvaWQgcXhsX2ltYWdlX2ZyZWVfb2JqZWN0cyhzdHJ1Y3Qg
cXhsX2RldmljZSAqcWRldiwgc3RydWN0IHF4bF9kcm1faW1hZ2UgKmRpbWFn
ZSk7PGJyPjxicj4tdm9pZCBxeGxfdXBkYXRlX3NjcmVlbihzdHJ1Y3QgcXhs
X2RldmljZSAqcXhsKTs8YnI+LTxicj4vKiBxeGwgaW8gb3BlcmF0aW9ucyAo
cXhsX2NtZC5jKSAqLzxicj48YnI+dm9pZCBxeGxfaW9fY3JlYXRlX3ByaW1h
cnkoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsPGJyPkBAIC00NDUsOCArNDQw
LDYgQEAgaW50IHF4bF9od19zdXJmYWNlX2RlYWxsb2Moc3RydWN0IHF4bF9k
ZXZpY2UgKnFkZXYsPGJyPjxicj5pbnQgcXhsX2JvX2NoZWNrX2lkKHN0cnVj
dCBxeGxfZGV2aWNlICpxZGV2LCBzdHJ1Y3QgcXhsX2JvICpibyk7PGJyPjxi
cj4tc3RydWN0IHF4bF9kcnZfc3VyZmFjZSAqPGJyPi1xeGxfc3VyZmFjZV9s
b29rdXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IHN1cmZhY2VfaWQp
Ozxicj52b2lkIHF4bF9zdXJmYWNlX2V2aWN0KHN0cnVjdCBxeGxfZGV2aWNl
ICpxZGV2LCBzdHJ1Y3QgcXhsX2JvICpzdXJmLCBib29sIGZyZWVpbmcpOzxi
cj48YnI+LyogcXhsX2lvY3RsLmMgKi88YnI+LS0gPGJyPjIuMjUuMTxicj48
YnI+PC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+

--nsmail-1618ncacani-1619xa3rchb--

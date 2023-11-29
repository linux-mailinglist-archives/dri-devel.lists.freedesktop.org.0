Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E097FCCDF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 03:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EC610E5E3;
	Wed, 29 Nov 2023 02:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A2210E5E5;
 Wed, 29 Nov 2023 02:29:46 +0000 (UTC)
X-UUID: 12cb57e063ed4c0686c2415175da53a6-20231129
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:4b639241-3002-484c-aebb-012adb240e4e, IP:15,
 URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-INFO: VERSION:1.1.33, REQID:4b639241-3002-484c-aebb-012adb240e4e, IP:15,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-5
X-CID-META: VersionHash:364b77b, CLOUDID:0cabed95-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:2311291029361HML246R,BulkQuantity:0,Recheck:0,SF:66|24|17|19|44|102,
 TC:0,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI, TF_CID_SPAM_ULN, TF_CID_SPAM_SNR,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: 12cb57e063ed4c0686c2415175da53a6-20231129
Received: from node4.com.cn [(39.156.73.12)] by mailgw
 (envelope-from <heminhong@kylinos.cn>) (Generic MTA)
 with ESMTP id 1297425312; Wed, 29 Nov 2023 10:29:34 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
 by node4.com.cn (NSMail) with SMTP id 07F2216001CC8;
 Wed, 29 Nov 2023 10:29:34 +0800 (CST)
Received: by node4.com.cn (NSMail, from userid 0)
 id EDB7C16001CC8; Wed, 29 Nov 2023 10:29:33 +0800 (CST)
From: =?UTF-8?B?5L2V5pWP57qi?= <heminhong@kylinos.cn>
Subject: =?UTF-8?B?5Zue5aSNOiBbUEFUQ0ggdjJdIGRybS9pOTE1OiBjb3JyZWN0IHRoZSBpbnB1dCBwYXJhbWV0ZXIgb24gX2ludGVsX2RzYl9jb21taXQoKQ==?=
To: =?UTF-8?B?dmlsbGUuc3lyamFsYQ==?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?B?dW1hLnNoYW5rYXI=?= <uma.shankar@intel.com>,
Date: Wed, 29 Nov 2023 10:29:33 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <1lagfvi0ner-1laizr4ur2c@nsmail7.0.0--kylin--1>
References: 20231114024341.14524-1-heminhong@kylinos.cn
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Wed, 29 Nov 2023 10:29:33 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-1p2080cqqh2-1p21hy65sav
X-ns-mid: webmail-6566a20d-1oux04x4
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
Cc: =?UTF-8?B?dHZydGtvLnVyc3VsaW4=?= <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?B?a2VybmVsIHRlc3Qgcm9ib3Q=?= <lkp@intel.com>,
 =?UTF-8?B?YW5pbWVzaC5tYW5uYQ==?= <animesh.manna@intel.com>,
 =?UTF-8?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?ZHJpLWRldmVs?= <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?cm9kcmlnby52aXZp?= <rodrigo.vivi@intel.com>,
 =?UTF-8?B?YW5raXQuay5uYXV0aXlhbA==?= <ankit.k.nautiyal@intel.com>,
 =?UTF-8?B?aW50ZWwtZ2Z4?= <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This message is in MIME format.

--nsmail-1p2080cqqh2-1p21hy65sav
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHByZSBjbGFzcz0ianNfbWVzc2FnZV9wbGFpbiBuZy1iaW5kaW5nIiBzdHls
ZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IGZvbnQt
ZmFtaWx5OiBpbmhlcml0OyBmb250LXNpemU6IDE0cHg7IHdoaXRlLXNwYWNl
OiBwcmUtd3JhcDsgd29yZC1icmVhazogbm9ybWFsOyBiYWNrZ3JvdW5kLWNv
bG9yOiAjZmZmZmZmOyI+RnJpZW5kbHkgcGluZy4gSSB0aGluayB0aGlzIHBh
dGNoIHdhcyBmb3Jnb3R0ZW4uPC9wcmU+CjxwPjxicj48YnI+LS0tLTwvcD4K
PGRpdiBpZD0iY3MyY19tYWlsX3NpZ2F0dXJlIj48L2Rpdj4KPHA+Jm5ic3A7
PC9wPgo8ZGl2IGlkPSJyZSIgc3R5bGU9Im1hcmdpbi1sZWZ0OiAwLjVlbTsg
cGFkZGluZy1sZWZ0OiAwLjVlbTsgYm9yZGVyLWxlZnQ6IDFweCBzb2xpZCBn
cmVlbjsiPjxicj48YnI+PGJyPgo8ZGl2IHN0eWxlPSJiYWNrZ3JvdW5kLWNv
bG9yOiAjZjVmN2ZhOyI+PHN0cm9uZz7kuLvjgIDpopjvvJo8L3N0cm9uZz48
c3BhbiBpZD0ic3ViamVjdCI+W1BBVENIIHYyXSBkcm0vaTkxNTogY29ycmVj
dCB0aGUgaW5wdXQgcGFyYW1ldGVyIG9uIF9pbnRlbF9kc2JfY29tbWl0KCk8
L3NwYW4+IDxicj48c3Ryb25nPuaXpeOAgOacn++8mjwvc3Ryb25nPjxzcGFu
IGlkPSJkYXRlIj4yMDIzLTExLTE0IDEwOjQzPC9zcGFuPiA8YnI+PHN0cm9u
Zz7lj5Hku7bkurrvvJo8L3N0cm9uZz48c3BhbiBpZD0iZnJvbSI+5L2V5pWP
57qiPC9zcGFuPiA8YnI+PHN0cm9uZz7mlLbku7bkurrvvJo8L3N0cm9uZz48
c3BhbiBpZD0idG8iIHN0eWxlPSJ3b3JkLWJyZWFrOiBicmVhay1hbGw7Ij7k
vZXmlY/nuqI7PC9zcGFuPjwvZGl2Pgo8YnI+CjxkaXYgaWQ9ImNvbnRlbnQi
Pgo8ZGl2IGNsYXNzPSJ2aWV3ZXJfcGFydCIgc3R5bGU9InBvc2l0aW9uOiBy
ZWxhdGl2ZTsiPgo8ZGl2PkN1cnJlbnQsIHRoZSBkZXdha2Vfc2NhbmxpbmUg
dmFyaWFibGUgaXMgZGVmaW5lZCBhcyB1bnNpZ25lZCBpbnQsPGJyPmFuIHVu
c2lnbmVkIGludCB2YXJpYWJsZSB0aGF0IGlzIGFsd2F5cyBncmVhdGVyIHRo
YW4gb3IgZXF1YWwgdG8gMC48YnI+d2hlbiBfaW50ZWxfZHNiX2NvbW1pdCBm
dW5jdGlvbiBpcyBjYWxsZWQgYnkgaW50ZWxfZHNiX2NvbW1pdCBmdW5jdGlv
biw8YnI+dGhlIGRld2FrZV9zY2FubGluZSB2YXJpYWJsZSBtYXkgaGF2ZSBh
biBpbnQgdmFsdWUuPGJyPlNvIHRoZSBkZXdha2Vfc2NhbmxpbmUgdmFyaWFi
bGUgaXMgbmVjZXNzYXJ5IHRvIGRlZmluZWQgYXMgYW4gaW50Ljxicj48YnI+
Rml4ZXM6IGY4M2I5NGQyMzc3MCAoImRybS9pOTE1L2RzYjogVXNlIERFd2Fr
ZSB0byBjb21iYXQgUGtnQyBsYXRlbmN5Iik8YnI+UmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxicj5DbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzEwMDUyMjAxLkFuVmJwZ1ByLWxr
cEBpbnRlbC5jb20vPGJyPkNjOiBWaWxsZSBTeXJqw6Rsw6QgPGJyPkNjOiBV
bWEgU2hhbmthciA8YnI+PGJyPlNpZ25lZC1vZmYtYnk6IGhlbWluaG9uZyA8
YnI+LS0tPGJyPmRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHNiLmMgfCAyICstPGJyPjEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKTxicj48YnI+ZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jPGJyPmluZGV4IDc4YjZm
ZTI0ZGNkOC4uN2ZkNjI4MGM1NGE3IDEwMDY0NDxicj4tLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jPGJyPisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmM8YnI+QEAg
LTM0MCw3ICszNDAsNyBAQCBzdGF0aWMgaW50IGludGVsX2RzYl9kZXdha2Vf
c2NhbmxpbmUoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUpPGJyPn08YnI+PGJyPnN0YXRpYyB2b2lkIF9pbnRlbF9kc2JfY29t
bWl0KHN0cnVjdCBpbnRlbF9kc2IgKmRzYiwgdTMyIGN0cmwsPGJyPi0gdW5z
aWduZWQgaW50IGRld2FrZV9zY2FubGluZSk8YnI+KyBpbnQgZGV3YWtlX3Nj
YW5saW5lKTxicj57PGJyPnN0cnVjdCBpbnRlbF9jcnRjICpjcnRjID0gZHNi
LSZndDtjcnRjOzxicj5zdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3By
aXYgPSB0b19pOTE1KGNydGMtJmd0O2Jhc2UuZGV2KTs8YnI+LS0gPGJyPjIu
MjUuMTxicj48YnI+PC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+

--nsmail-1p2080cqqh2-1p21hy65sav--

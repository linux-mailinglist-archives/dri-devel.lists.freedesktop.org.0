Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3E482801A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96C710E3E7;
	Tue,  9 Jan 2024 08:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3840D10E37D;
 Tue,  9 Jan 2024 08:10:04 +0000 (UTC)
X-UUID: 3f655d7d5e3a46adb28f2139e8489694-20240109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:36170c0d-e759-41ff-97ed-c29764401da0, IP:10,
 URL:0,TC:0,Content:-25,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,A
 CTION:release,TS:-5
X-CID-INFO: VERSION:1.1.35, REQID:36170c0d-e759-41ff-97ed-c29764401da0, IP:10,
 UR
 L:0,TC:0,Content:-25,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:bbdb0c8e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:24010916095805H97UUD,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
 02,TC:0,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 3f655d7d5e3a46adb28f2139e8489694-20240109
Received: from node2.com.cn [(39.156.73.10)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 999417023; Tue, 09 Jan 2024 16:09:55 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id 3ECBFB807587;
 Tue,  9 Jan 2024 16:09:55 +0800 (CST)
Received: by node2.com.cn (NSMail, from userid 0)
 id 3360BB807587; Tue,  9 Jan 2024 16:09:55 +0800 (CST)
From: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>
Subject: =?UTF-8?B?5Zue5aSNOiBSZTog5Zue5aSNOiBSZTogW1BBVENIIGxpYmRybSAxLzJdIGFtZGdwdTogZml4IHBhcmFtZXRlciBvZiBhbWRncHVfY3NfY3R4X2NyZWF0ZTI=?=
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2xzYWs=?= <marek.olsak@amd.com>,
 =?UTF-8?B?UGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXI=?=
 <pierre-eric.pelloux-prayer@amd.com>, 
 =?UTF-8?B?ZHJpLWRldmVs?= <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?YW1kLWdmeA==?= <amd-gfx@lists.freedesktop.org>,
Date: Tue, 09 Jan 2024 16:09:54 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <1uy9gy5eaet-1uyc0ts8e2e@nsmail7.0.0--kylin--1>
References: 32ffe817-498b-48ba-bc33-3fc0fa3fb8dd@amd.com
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Tue, 09 Jan 2024 16:09:54 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-1yaykhly3w8-1yazuffd5q1
X-ns-mid: webmail-659cff52-1xvbt88k
X-ope-from: <lizhenneng@kylinos.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This message is in MIME format.

--nsmail-1yaykhly3w8-1yazuffd5q1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHA+VGhhbmtzITwvcD4KPHA+V2hhdCBhYm91dCB0aGUgc2Vjb25kIHBhdGNo
PzwvcD4KPHA+VGhlIHNlY29uZCBwYXRjaDombmJzcDsmbmJzcDsgYW1kZ3B1
OiBjaGFuZ2UgcHJvaXJpdHkgdmFsdWUgdG8gYmUgY29uc2lzdGVudCB3aXRo
IGtlcm5lbC48L3A+CjxwPkFzIEkgd2FudCB0byBwYXNzIEFNREdQVV9DVFhf
UFJJT1JJVFlfTE9XIHRvIGtlcm5lbCBtb2R1bGUgZHJtLXNjaGVkdWxlciwg
aWYgdGhlc2UgdHdvIHBhdGNoZXMgYXJlIG5vdCBhcHBseWVkLCZuYnNwOzwv
cD4KPHA+SXQgY2FuIG5vdCBwYXNzIExPVyBwcmlvcml0eSB0byBkcm0tc2No
ZWR1bGVyLjwvcD4KPHA+RG8geW91IGhhdmUgYW55IG90aGVyIHN1Z2dlc3Rp
b24/PC9wPgo8cD48YnI+PGJyPjxicj48YnI+PGJyPjxicj4tLS0tPC9wPgo8
ZGl2IGlkPSJjczJjX21haWxfc2lnYXR1cmUiPjwvZGl2Pgo8cD4mbmJzcDs8
L3A+CjxkaXYgaWQ9InJlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6IDAuNWVtOyBw
YWRkaW5nLWxlZnQ6IDAuNWVtOyBib3JkZXItbGVmdDogMXB4IHNvbGlkIGdy
ZWVuOyI+PGJyPjxicj48YnI+CjxkaXYgc3R5bGU9ImJhY2tncm91bmQtY29s
b3I6ICNmNWY3ZmE7Ij48c3Ryb25nPuS4u+OAgOmimO+8mjwvc3Ryb25nPjxz
cGFuIGlkPSJzdWJqZWN0Ij5SZTog5Zue5aSNOiBSZTogW1BBVENIIGxpYmRy
bSAxLzJdIGFtZGdwdTogZml4IHBhcmFtZXRlciBvZiBhbWRncHVfY3NfY3R4
X2NyZWF0ZTI8L3NwYW4+IDxicj48c3Ryb25nPuaXpeOAgOacn++8mjwvc3Ry
b25nPjxzcGFuIGlkPSJkYXRlIj4yMDI0LTAxLTA5IDE1OjE1PC9zcGFuPiA8
YnI+PHN0cm9uZz7lj5Hku7bkurrvvJo8L3N0cm9uZz48c3BhbiBpZD0iZnJv
bSI+Q2hyaXN0aWFuIEvDtm5pZzwvc3Bhbj4gPGJyPjxzdHJvbmc+5pS25Lu2
5Lq677yaPC9zdHJvbmc+PHNwYW4gaWQ9InRvIiBzdHlsZT0id29yZC1icmVh
azogYnJlYWstYWxsOyI+5p2O55yf6IO9O01hcmVrIE9sc2FrO1BpZXJyZS1F
cmljIFBlbGxvdXgtUHJheWVyO2RyaS1kZXZlbDthbWQtZ2Z4Ozwvc3Bhbj48
L2Rpdj4KPGJyPgo8ZGl2IGlkPSJjb250ZW50Ij4KPGRpdiBjbGFzcz0idmll
d2VyX3BhcnQiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7Ij4KPGRpdj5B
bSAwOS4wMS4yNCB1bSAwMjo1MCBzY2hyaWViIOadjuecn+iDvTo8YnI+Cjxw
PldoZW4gdGhlIHByaW9yaXR5IHZhbHVlIGlzIHBhc3NlZCB0byB0aGUga2Vy
bmVsLCB0aGUga2VybmVsIGNvbXBhcmVzIGl0IHdpdGggdGhlIGZvbGxvd2lu
ZyB2YWx1ZXM6PC9wPgo8cD4jZGVmaW5lIEFNREdQVV9DVFhfUFJJT1JJVFlf
VkVSWV9MT1cmbmJzcDsmbmJzcDsmbmJzcDsgLTEwMjM8YnI+I2RlZmluZSBB
TURHUFVfQ1RYX1BSSU9SSVRZX0xPVyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAtNTEyPGJyPiNkZWZpbmUgQU1E
R1BVX0NUWF9QUklPUklUWV9OT1JNQUwmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgMDxicj4jZGVmaW5lIEFNREdQVV9DVFhfUFJJT1JJVFlfSElH
SCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA1
MTI8YnI+I2RlZmluZSBBTURHUFVfQ1RYX1BSSU9SSVRZX1ZFUllfSElHSCZu
YnNwOyZuYnNwOyAxMDIzPC9wPgo8cD5JZiBwcmlvcml0eSBpcyB1aW50MzJf
dCwgd2UgY2FuJ3Qgc2V0IExPVyBhbmQgVkVSWV9MT1cgdmFsdWUgdG8ga2Vy
bmVsIGNvbnRleHQgcHJpb3JpdHksPC9wPgo8YnI+V2VsbCB0aGF0J3Mgbm9u
c2Vuc2UuPGJyPjxicj5Ib3cgdGhlIGtlcm5lbCBoYW5kbGVzIHRoZSB2YWx1
ZXMgYW5kIGhvdyB1c2Vyc3BhY2UgaGFuZGxlcyB0aGVtIGFyZSB0d28gc2Vw
YXJhdGUgdGhpbmdzLiBZb3UganVzdCBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0
IGl0J3MgYWx3YXlzIDMyIGJpdHMuPGJyPjxicj5JbiBvdGhlciB3b3JkcyBp
ZiB5b3UgaGF2ZSBzaWduZWQgb3IgdW5zaWduZWQgZGF0YSB0eXBlIGluIHVz
ZXJzcGFjZSBpcyBpcnJlbGV2YW50IGZvciB0aGUga2VybmVsLjxicj48YnI+
CjxwPllvdSBjYW4gcmVmZXIgdG8gdGhlIGtlcm5lbCBmdW5jdGlvbiBhbWRn
cHVfY3R4X3ByaW9yaXR5X3Blcm1pdCwgaWYgcHJpb3JpdHkgaXMgZ3JlYXRl
cjwvcD4KPHA+dGhhbiAwLCBhbmQgdGhpcyBwcm9jZXNzIGhhcyBub3QmbmJz
cDsgQ0FQX1NZU19OSUNFIGNhcGliaWxpdHkgb3IgRFJNX01BU1RFUiBwZXJt
aXNzaW9uLDwvcD4KPHA+dGhpcyBwcm9jZXNzIHdpbGwgYmUgZXhpdGVkLjwv
cD4KPGJyPkNvcnJlY3QsIHRoYXQncyBpbnRlbnRpb25hbC48YnI+PGJyPlJl
Z2FyZHMsPGJyPkNocmlzdGlhbi48YnI+PGJyPgo8cD48YnI+PGJyPjxicj48
YnI+PGJyPi0tLS08L3A+CjxwPiZuYnNwOzwvcD4KPGRpdiBpZD0icmUiIHN0
eWxlPSJtYXJnaW4tbGVmdDogMC41ZW07IHBhZGRpbmctbGVmdDogMC41ZW07
IGJvcmRlci1sZWZ0OiAxcHggc29saWQgZ3JlZW47Ij48YnI+PGJyPjxicj4K
PGRpdiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogI2Y1ZjdmYTsiPjxzdHJv
bmc+5Li744CA6aKY77yaPC9zdHJvbmc+PHNwYW4gaWQ9InN1YmplY3QiPlJl
OiBbUEFUQ0ggbGliZHJtIDEvMl0gYW1kZ3B1OiBmaXggcGFyYW1ldGVyIG9m
IGFtZGdwdV9jc19jdHhfY3JlYXRlMjwvc3Bhbj4gPGJyPjxzdHJvbmc+5pel
44CA5pyf77yaPC9zdHJvbmc+PHNwYW4gaWQ9ImRhdGUiPjIwMjQtMDEtMDkg
MDA6Mjg8L3NwYW4+IDxicj48c3Ryb25nPuWPkeS7tuS6uu+8mjwvc3Ryb25n
PjxzcGFuIGlkPSJmcm9tIj5DaHJpc3RpYW4gS8O2bmlnPC9zcGFuPiA8YnI+
PHN0cm9uZz7mlLbku7bkurrvvJo8L3N0cm9uZz48c3BhbiBpZD0idG8iIHN0
eWxlPSJ3b3JkLWJyZWFrOiBicmVhay1hbGw7Ij7mnY7nnJ/og707TWFyZWsg
T2xzYWs7UGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXI7ZHJpLWRldmVsO2Ft
ZC1nZng7PC9zcGFuPjwvZGl2Pgo8YnI+CjxkaXYgaWQ9ImNvbnRlbnQiPgo8
ZGl2IGNsYXNzPSJ2aWV3ZXJfcGFydCIgc3R5bGU9InBvc2l0aW9uOiByZWxh
dGl2ZTsiPgo8ZGl2PkFtIDA4LjAxLjI0IHVtIDEwOjQwIHNjaHJpZWIgWmhl
bm5lbmcgTGk6PGJyPiZndDsgSW4gb3JkZXIgdG8gcGFzcyB0aGUgY29ycmVj
dCBwcmlvcml0eSBwYXJhbWV0ZXIgdG8gdGhlIGtlcm5lbCw8YnI+Jmd0OyB3
ZSBtdXN0IGNoYW5nZSBwcmlvcml0eSB0eXBlIGZyb20gdWludDMyX3QgdG8g
aW50MzJfdC48YnI+PGJyPkh1aSB3aGF0PyBXaHkgc2hvdWxkIGl0IG1hdHRl
ciBpZiB0aGUgcGFyYW1ldGVyIGlzIHNpZ25lZCBvciBub3Q/PGJyPjxicj5U
aGF0IGRvZXNuJ3Qgc2VlbSB0byBtYWtlIHNlbnNlLjxicj48YnI+UmVnYXJk
cyw8YnI+Q2hyaXN0aWFuLjxicj48YnI+Jmd0Ozxicj4mZ3Q7IFNpZ25lZC1v
ZmYtYnk6IFpoZW5uZW5nIExpIDxicj4mZ3Q7IC0tLTxicj4mZ3Q7IGFtZGdw
dS9hbWRncHUuaCB8IDIgKy08YnI+Jmd0OyBhbWRncHUvYW1kZ3B1X2NzLmMg
fCAyICstPGJyPiZndDsgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pPGJyPiZndDs8YnI+Jmd0OyBkaWZmIC0tZ2l0
IGEvYW1kZ3B1L2FtZGdwdS5oIGIvYW1kZ3B1L2FtZGdwdS5oPGJyPiZndDsg
aW5kZXggOWJkYmYzNjYuLmY0Njc1M2YzIDEwMDY0NDxicj4mZ3Q7IC0tLSBh
L2FtZGdwdS9hbWRncHUuaDxicj4mZ3Q7ICsrKyBiL2FtZGdwdS9hbWRncHUu
aDxicj4mZ3Q7IEBAIC04OTYsNyArODk2LDcgQEAgaW50IGFtZGdwdV9ib19s
aXN0X3VwZGF0ZShhbWRncHVfYm9fbGlzdF9oYW5kbGUgaGFuZGxlLDxicj4m
Z3Q7ICo8YnI+Jmd0OyAqLzxicj4mZ3Q7IGludCBhbWRncHVfY3NfY3R4X2Ny
ZWF0ZTIoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LDxicj4mZ3Q7IC0gdWlu
dDMyX3QgcHJpb3JpdHksPGJyPiZndDsgKyBpbnQzMl90IHByaW9yaXR5LDxi
cj4mZ3Q7IGFtZGdwdV9jb250ZXh0X2hhbmRsZSAqY29udGV4dCk7PGJyPiZn
dDsgLyoqPGJyPiZndDsgKiBDcmVhdGUgR1BVIGV4ZWN1dGlvbiBDb250ZXh0
PGJyPiZndDsgZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVfY3MuYyBiL2Ft
ZGdwdS9hbWRncHVfY3MuYzxicj4mZ3Q7IGluZGV4IDQ5ZmMxNmMzLi5lYjcy
YzYzOCAxMDA2NDQ8YnI+Jmd0OyAtLS0gYS9hbWRncHUvYW1kZ3B1X2NzLmM8
YnI+Jmd0OyArKysgYi9hbWRncHUvYW1kZ3B1X2NzLmM8YnI+Jmd0OyBAQCAt
NDksNyArNDksNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19yZXNldF9zZW0o
YW1kZ3B1X3NlbWFwaG9yZV9oYW5kbGUgc2VtKTs8YnI+Jmd0OyAqIFxyZXR1
cm4gMCBvbiBzdWNjZXNzIG90aGVyd2lzZSBQT1NJWCBFcnJvciBjb2RlPGJy
PiZndDsgKi88YnI+Jmd0OyBkcm1fcHVibGljIGludCBhbWRncHVfY3NfY3R4
X2NyZWF0ZTIoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LDxicj4mZ3Q7IC0g
dWludDMyX3QgcHJpb3JpdHksPGJyPiZndDsgKyBpbnQzMl90IHByaW9yaXR5
LDxicj4mZ3Q7IGFtZGdwdV9jb250ZXh0X2hhbmRsZSAqY29udGV4dCk8YnI+
Jmd0OyB7PGJyPiZndDsgc3RydWN0IGFtZGdwdV9jb250ZXh0ICpncHVfY29u
dGV4dDs8YnI+PGJyPjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rp
dj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4=

--nsmail-1yaykhly3w8-1yazuffd5q1--

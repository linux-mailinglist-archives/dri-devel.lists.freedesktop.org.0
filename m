Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A54D827CA1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 02:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7DA10E297;
	Tue,  9 Jan 2024 01:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377B610E297;
 Tue,  9 Jan 2024 01:51:05 +0000 (UTC)
X-UUID: 9afc5db5ea9c429291d955778aa66c2b-20240109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:cceb3edc-46f5-4556-9e8b-c68a3ae13a27, IP:10,
 URL:0,TC:3,Content:-25,EDM:25,RT:0,SF:25,FILE:0,BULK:0,RULE:Release_Ham,AC
 TION:release,TS:38
X-CID-INFO: VERSION:1.1.35, REQID:cceb3edc-46f5-4556-9e8b-c68a3ae13a27, IP:10,
 UR
 L:0,TC:3,Content:-25,EDM:25,RT:0,SF:25,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:38
X-CID-META: VersionHash:5d391d7, CLOUDID:c180088e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:24010909505952X584T3,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|3
 3|102,TC:0,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,
 TF_CID_SPAM_ERI, TF_CID_SPAM_FSI
X-UUID: 9afc5db5ea9c429291d955778aa66c2b-20240109
Received: from node2.com.cn [(39.156.73.10)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 1520001951; Tue, 09 Jan 2024 09:50:56 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id E2811B80758A;
 Tue,  9 Jan 2024 09:50:55 +0800 (CST)
Received: by node2.com.cn (NSMail, from userid 0)
 id C5CAEB807587; Tue,  9 Jan 2024 09:50:55 +0800 (CST)
From: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>
Subject: =?UTF-8?B?5Zue5aSNOiBSZTogW1BBVENIIGxpYmRybSAxLzJdIGFtZGdwdTogZml4IHBhcmFtZXRlciBvZiBhbWRncHVfY3NfY3R4X2NyZWF0ZTI=?=
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2xzYWs=?= <marek.olsak@amd.com>,
 =?UTF-8?B?UGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXI=?=
 <pierre-eric.pelloux-prayer@amd.com>, 
 =?UTF-8?B?ZHJpLWRldmVs?= <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?YW1kLWdmeA==?= <amd-gfx@lists.freedesktop.org>,
Date: Tue, 09 Jan 2024 09:50:55 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <xrg6qu5muv-xriqmgzqig@nsmail7.0.0--kylin--1>
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Tue, 09 Jan 2024 09:50:55 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-10ztlolp9fe-10zuvmf4b97
X-ns-mid: webmail-659ca67f-10ukqnnt
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

--nsmail-10ztlolp9fe-10zuvmf4b97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHA+V2hlbiB0aGUgcHJpb3JpdHkgdmFsdWUgaXMgcGFzc2VkIHRvIHRoZSBr
ZXJuZWwsIHRoZSBrZXJuZWwgY29tcGFyZXMgaXQgd2l0aCB0aGUgZm9sbG93
aW5nIHZhbHVlczo8L3A+CjxwPiNkZWZpbmUgQU1ER1BVX0NUWF9QUklPUklU
WV9WRVJZX0xPVyZuYnNwOyZuYnNwOyZuYnNwOyAtMTAyMzxicj4jZGVmaW5l
IEFNREdQVV9DVFhfUFJJT1JJVFlfTE9XJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC01MTI8YnI+I2RlZmluZSBB
TURHUFVfQ1RYX1BSSU9SSVRZX05PUk1BTCZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAwPGJyPiNkZWZpbmUgQU1ER1BVX0NUWF9QUklPUklUWV9I
SUdIJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IDUxMjxicj4jZGVmaW5lIEFNREdQVV9DVFhfUFJJT1JJVFlfVkVSWV9ISUdI
Jm5ic3A7Jm5ic3A7IDEwMjM8L3A+CjxwPklmIHByaW9yaXR5IGlzIHVpbnQz
Ml90LCB3ZSBjYW4ndCBzZXQgTE9XIGFuZCBWRVJZX0xPVyB2YWx1ZSB0byBr
ZXJuZWwgY29udGV4dCBwcmlvcml0eSw8L3A+CjxwPllvdSBjYW4gcmVmZXIg
dG8gdGhlIGtlcm5lbCBmdW5jdGlvbiBhbWRncHVfY3R4X3ByaW9yaXR5X3Bl
cm1pdCwgaWYgcHJpb3JpdHkgaXMgZ3JlYXRlcjwvcD4KPHA+dGhhbiAwLCBh
bmQgdGhpcyBwcm9jZXNzIGhhcyBub3QmbmJzcDsgQ0FQX1NZU19OSUNFIGNh
cGliaWxpdHkgb3IgRFJNX01BU1RFUiBwZXJtaXNzaW9uLDwvcD4KPHA+dGhp
cyBwcm9jZXNzIHdpbGwgYmUgZXhpdGVkLjxicj48YnI+PGJyPjxicj48YnI+
PGJyPi0tLS08L3A+CjxkaXYgaWQ9ImNzMmNfbWFpbF9zaWdhdHVyZSI+PC9k
aXY+CjxwPiZuYnNwOzwvcD4KPGRpdiBpZD0icmUiIHN0eWxlPSJtYXJnaW4t
bGVmdDogMC41ZW07IHBhZGRpbmctbGVmdDogMC41ZW07IGJvcmRlci1sZWZ0
OiAxcHggc29saWQgZ3JlZW47Ij48YnI+PGJyPjxicj4KPGRpdiBzdHlsZT0i
YmFja2dyb3VuZC1jb2xvcjogI2Y1ZjdmYTsiPjxzdHJvbmc+5Li744CA6aKY
77yaPC9zdHJvbmc+PHNwYW4gaWQ9InN1YmplY3QiPlJlOiBbUEFUQ0ggbGli
ZHJtIDEvMl0gYW1kZ3B1OiBmaXggcGFyYW1ldGVyIG9mIGFtZGdwdV9jc19j
dHhfY3JlYXRlMjwvc3Bhbj4gPGJyPjxzdHJvbmc+5pel44CA5pyf77yaPC9z
dHJvbmc+PHNwYW4gaWQ9ImRhdGUiPjIwMjQtMDEtMDkgMDA6Mjg8L3NwYW4+
IDxicj48c3Ryb25nPuWPkeS7tuS6uu+8mjwvc3Ryb25nPjxzcGFuIGlkPSJm
cm9tIj5DaHJpc3RpYW4gS8O2bmlnPC9zcGFuPiA8YnI+PHN0cm9uZz7mlLbk
u7bkurrvvJo8L3N0cm9uZz48c3BhbiBpZD0idG8iIHN0eWxlPSJ3b3JkLWJy
ZWFrOiBicmVhay1hbGw7Ij7mnY7nnJ/og707TWFyZWsgT2xzYWs7UGllcnJl
LUVyaWMgUGVsbG91eC1QcmF5ZXI7ZHJpLWRldmVsO2FtZC1nZng7PC9zcGFu
PjwvZGl2Pgo8YnI+CjxkaXYgaWQ9ImNvbnRlbnQiPgo8ZGl2IGNsYXNzPSJ2
aWV3ZXJfcGFydCIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsiPgo8ZGl2
PkFtIDA4LjAxLjI0IHVtIDEwOjQwIHNjaHJpZWIgWmhlbm5lbmcgTGk6PGJy
PiZndDsgSW4gb3JkZXIgdG8gcGFzcyB0aGUgY29ycmVjdCBwcmlvcml0eSBw
YXJhbWV0ZXIgdG8gdGhlIGtlcm5lbCw8YnI+Jmd0OyB3ZSBtdXN0IGNoYW5n
ZSBwcmlvcml0eSB0eXBlIGZyb20gdWludDMyX3QgdG8gaW50MzJfdC48YnI+
PGJyPkh1aSB3aGF0PyBXaHkgc2hvdWxkIGl0IG1hdHRlciBpZiB0aGUgcGFy
YW1ldGVyIGlzIHNpZ25lZCBvciBub3Q/PGJyPjxicj5UaGF0IGRvZXNuJ3Qg
c2VlbSB0byBtYWtlIHNlbnNlLjxicj48YnI+UmVnYXJkcyw8YnI+Q2hyaXN0
aWFuLjxicj48YnI+Jmd0Ozxicj4mZ3Q7IFNpZ25lZC1vZmYtYnk6IFpoZW5u
ZW5nIExpIDxicj4mZ3Q7IC0tLTxicj4mZ3Q7IGFtZGdwdS9hbWRncHUuaCB8
IDIgKy08YnI+Jmd0OyBhbWRncHUvYW1kZ3B1X2NzLmMgfCAyICstPGJyPiZn
dDsgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pPGJyPiZndDs8YnI+Jmd0OyBkaWZmIC0tZ2l0IGEvYW1kZ3B1L2Ft
ZGdwdS5oIGIvYW1kZ3B1L2FtZGdwdS5oPGJyPiZndDsgaW5kZXggOWJkYmYz
NjYuLmY0Njc1M2YzIDEwMDY0NDxicj4mZ3Q7IC0tLSBhL2FtZGdwdS9hbWRn
cHUuaDxicj4mZ3Q7ICsrKyBiL2FtZGdwdS9hbWRncHUuaDxicj4mZ3Q7IEBA
IC04OTYsNyArODk2LDcgQEAgaW50IGFtZGdwdV9ib19saXN0X3VwZGF0ZShh
bWRncHVfYm9fbGlzdF9oYW5kbGUgaGFuZGxlLDxicj4mZ3Q7ICo8YnI+Jmd0
OyAqLzxicj4mZ3Q7IGludCBhbWRncHVfY3NfY3R4X2NyZWF0ZTIoYW1kZ3B1
X2RldmljZV9oYW5kbGUgZGV2LDxicj4mZ3Q7IC0gdWludDMyX3QgcHJpb3Jp
dHksPGJyPiZndDsgKyBpbnQzMl90IHByaW9yaXR5LDxicj4mZ3Q7IGFtZGdw
dV9jb250ZXh0X2hhbmRsZSAqY29udGV4dCk7PGJyPiZndDsgLyoqPGJyPiZn
dDsgKiBDcmVhdGUgR1BVIGV4ZWN1dGlvbiBDb250ZXh0PGJyPiZndDsgZGlm
ZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVfY3MuYyBiL2FtZGdwdS9hbWRncHVf
Y3MuYzxicj4mZ3Q7IGluZGV4IDQ5ZmMxNmMzLi5lYjcyYzYzOCAxMDA2NDQ8
YnI+Jmd0OyAtLS0gYS9hbWRncHUvYW1kZ3B1X2NzLmM8YnI+Jmd0OyArKysg
Yi9hbWRncHUvYW1kZ3B1X2NzLmM8YnI+Jmd0OyBAQCAtNDksNyArNDksNyBA
QCBzdGF0aWMgaW50IGFtZGdwdV9jc19yZXNldF9zZW0oYW1kZ3B1X3NlbWFw
aG9yZV9oYW5kbGUgc2VtKTs8YnI+Jmd0OyAqIFxyZXR1cm4gMCBvbiBzdWNj
ZXNzIG90aGVyd2lzZSBQT1NJWCBFcnJvciBjb2RlPGJyPiZndDsgKi88YnI+
Jmd0OyBkcm1fcHVibGljIGludCBhbWRncHVfY3NfY3R4X2NyZWF0ZTIoYW1k
Z3B1X2RldmljZV9oYW5kbGUgZGV2LDxicj4mZ3Q7IC0gdWludDMyX3QgcHJp
b3JpdHksPGJyPiZndDsgKyBpbnQzMl90IHByaW9yaXR5LDxicj4mZ3Q7IGFt
ZGdwdV9jb250ZXh0X2hhbmRsZSAqY29udGV4dCk8YnI+Jmd0OyB7PGJyPiZn
dDsgc3RydWN0IGFtZGdwdV9jb250ZXh0ICpncHVfY29udGV4dDs8YnI+PGJy
PjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pg==

--nsmail-10ztlolp9fe-10zuvmf4b97--
